require 'spec_helper'

describe_ohai_plugin :MSLicense do
  let(:plugin_file) { 'files/default/mslicensing.rb' }

  it 'provides mslicense' do
    expect(plugin).to provides_attribute('mslicense')
  end

  stdout = 'Software licensing service version: 10.0.14393.351\r\n'
  it 'correctly captures output' do
    stub_plugin_shell_out('cscript %windir%\system32\slmgr.vbs -dlv', stdout)
    expect(plugin_attribute('mslicense/windowslicense/serviceVersion')).to eq("10.0.14393.351")
  end
end