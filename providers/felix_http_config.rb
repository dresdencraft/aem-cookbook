require 'base64'

action :configure do
  directory "#{node['aem']['author']['base_dir']}}"/install do
    owner node[:aem][:aem_options]['RUNAS_USER']
    group node[:aem][:aem_options]['RUNAS_USER']
    mode '0755'
    action :create
  end
  if new_resource.ssl_enabled == 'true'
    template "#{node['aem']['author']['base_dir']}/install/org.apache.felix.http.config" do
      source 'org.apache.felix.http.config.erb'
      notifies :restart, "service[aem-author]"
      variables(
        http_disabled: new_resource.http_disabled,
        ssl_enabled: new_resource.ssl_enabled,
        ssl_port: new_resource.ssl_port,
        keystore_path: new_resource.keystore_path,
        keystore_password: new_resource.keystore_password
      )
    end
    file "#{node['aem']['author']['base_dir']}/../keystore.pkcs12" do
      content Base64.decode64(new_resource.keystore_pkcs12_base64)
      mode '0440'
      owner node[:aem][:aem_options]['RUNAS_USER']
      group node[:aem][:aem_options]['RUNAS_USER']
    end
  end
end
