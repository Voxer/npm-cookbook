#
# Cookbook Name:: npm
# Resource:: package
#
# Author:: Dave Eddy <dave@daveeddy.com>
# Author:: Anand Suresh <anand.suresh@voxer.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT
#

actions :install, :remove
default_action :install


attribute :name,
  :kind_of        => String,
  :name_attribute => true

attribute :package,
  :kind_of => String

attribute :version,
  :kind_of => String
