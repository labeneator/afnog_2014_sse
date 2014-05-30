# Cookbook Name:: afnog2014
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# Provisions a machine with topics covered in the SSE track of AFNOG

### Make sure that the apt recipe is the first one
Chef::Log.info 'Rough hewn recipe for installing afnog packages'
Chef::Log.info node.inspect

mail_package_list = %w[postfix dovecot]
web_package_list = %w[apache2]
config_mgmt_package_list = %w[]

package_lists = [mail_package_list, web_package_list, config_mgmt_package_list]

package_lists.each do |package_list|
	Chef::Log.info "Will attempt to install/upgrade packages: #{package_list.inspect}"
	package_list.each do |package|
	    Chef::Log.debug "Upgrading #{package}"
	    package "#{package}" do
		  action [:install, :upgrade]
	    end
	end
end
