#
# Cookbook:: ohai_ms_licensing
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#ohai_plugin 'microsoftlicense'

ohai_plugin 'mslicensing'

output="#{Chef::JSONCompat.to_json_pretty(node.to_hash)}"
file 'c:\\chef\\node.json' do
  content output
end