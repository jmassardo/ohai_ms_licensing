name 'ohai_ms_licensing'
maintainer 'James Massardo'
maintainer_email 'james@dxrf.com'
license 'All Rights Reserved'
description 'Ohai plugin for collecting MS Windows Licensing information'
long_description 'Ohai plugin for collecting MS Windows Licensing information'
version '1.0.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
depends 'ohai'
supports 'windows'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/jmassardo/ohai_ms_licensing/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/jmassard/ohai_ms_licensing'
