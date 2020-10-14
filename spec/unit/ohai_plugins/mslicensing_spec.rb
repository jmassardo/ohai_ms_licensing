require 'spec_helper'

describe_ohai_plugin :MSLicense do
  let(:plugin_file) { 'files/default/mslicensing.rb' }
  let(:platform) { 'windows' }

  it 'provides mslicense' do
    expect(plugin).to provides_attribute('mslicense')
  end

  let(:stdout) { "Software licensing service version: 10.0.14393.351\r\n" }

  it 'correctly captures output' do
    allow(plugin).to receive(:shell_out).with('cscript %windir%\system32\slmgr.vbs -dlv') { double(stdout: stdout, exitstatus: 0) }
    expect(plugin_attribute('mslicense/windowslicense/serviceVersion')).to eq('10.0.14393.351')
  end
end
