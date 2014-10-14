#
# Cookbook Name:: npm
# Provider:: package
#
# Author:: Dave Eddy <dave@daveeddy.com>
# Author:: Anand Suresh <anand.suresh@voxer.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT
#

use_inline_resources

def npm_module_version(pkg_name)
  prefix = node.run_state[:npm_prefix]
  if prefix.nil? then
    Chef::Log.debug '[npm] fetching system prefix'
    prefix = `npm config get prefix`.strip
    node.run_state[:npm_prefix] = prefix
  else
    Chef::Log.debug "[npm] system prefix found in run_state: #{prefix}"
  end
  f = "#{prefix}/lib/node_modules/#{pkg_name}/package.json"
  Chef::Log.debug "[npm] inspecting #{f}"
  JSON.parse(IO.read(f).force_encoding('ISO-8859-1').encode('utf-8', replace: nil))['version'] rescue nil
end

action :install do
  pkg = new_resource.name

  wanted_package = new_resource.package
  wanted_version = new_resource.version

  _s = pkg.split('@')
  wanted_package = _s[0] unless wanted_package
  wanted_version = _s[1] unless wanted_version

  installed_version = npm_module_version(wanted_package)
  Chef::Log.debug "[npm] :install npm_package[#{wanted_package}@#{wanted_version}]: " \
    "installed version: #{installed_version}"

  execute "Install npm package #{pkg}" do
    command ['npm', 'install', '-g', pkg]
    not_if { wanted_version.nil? && installed_version }
    only_if { !installed_version || wanted_version != installed_version }
  end
end

action :remove do
  pkg = new_resource.name

  wanted_package = new_resource.package
  wanted_version = new_resource.version

  _s = pkg.split('@')
  wanted_package = _s[0] unless wanted_package
  wanted_version = _s[1] unless wanted_version

  installed_version = npm_module_version(wanted_package)
  Chef::Log.debug "[npm] :uninstall npm_package[#{wanted_package}@#{wanted_version}]: " \
    "installed version: #{installed_version}"

  execute "Uninstall npm package #{pkg}" do
    command ['npm', '-g', 'uninstall', pkg]
    only_if { installed_version }
  end
end
