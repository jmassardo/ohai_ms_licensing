Ohai.plugin :MSLicense do
  provides 'mslicense'

  collect_data :default do
    begin
      mslicense(Mash.new)
      cmd = shell_out('cscript %windir%\system32\slmgr.vbs -dlv')
      mslicense[:windowslicense] = Mash.new
      mslicense[:windowslicense][:keyManagementService] = Mash.new

      if cmd.exitstatus == 0
        cmd.stdout.each_line() do |line|
          case line
          # Parse standard licensing data
          when /Software licensing service version/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["serviceVersion"] = data[1].chomp
          when /Activation ID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["activationId"] = data[1].chomp
          when /Application ID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["applicationId"] = data[1].chomp
          when /Extended PID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["extendedPid"] = data[1].chomp
          when /Product Key Channel/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["productKeyChannel"] = data[1].chomp
          when /Installation ID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["installationId"] = data[1].chomp
          when /Partial Product Key/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["partialProductKey"] = data[1].chomp
          when /License Status/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["licenseStatus"] = data[1].chomp
          when /Volume activation expiration/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["volumeActiviationExpiration"] = data[1].chomp
          when /Remaining Windows rearm count/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["windowsRearmCount"] = data[1].chomp
          when /Remaining SKU rearm count/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["skuRearmCount"] = data[1].chomp
          when /Trusted time/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense]["trustedTime"] = ("#{data[1]}:#{data[2]}:#{data[3]}").chomp

          # parse KMS client data
          when /Cient Machine ID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["clientMachineId"] = data[1].chomp
          when /Registered KMS machine name/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["registeredKmsMachineName"] = ("#{data[1]}:#{data[2]}").chomp
          when /KMS machine IP address/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["MachineIpAddress"] = data[1].chomp
          when /KMS machine extended PID/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["machineExtendedPid"] = data[1].chomp
          when /Activation interval/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["activationInterval"] = data[1].chomp
          when /Renewal interval/
            data = (line.split(':')).each(&:lstrip!)
            mslicense[:windowslicense][:keyManagementService]["renewalInterval"] = data[1].chomp
          when /KMS host caching/
            data = line.split(' ')
            mslicense[:windowslicense][:keyManagementService]["hostCaching"] = data[4].chomp
          else
            # do nothing
          end
        end
      end
    rescue Ohai::Exceptions::Exec
      logger.trace('Plugin MSLicensing: Could not shell_out "cscript %windir%\system32\slmgr.vbs -dlv". Skipping plugin')
    end

  end
end
