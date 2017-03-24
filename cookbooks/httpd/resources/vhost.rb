property :site_name, String
property :site_port, Fixnum

action :create do
  directory "/srv/apache/#{site_name}/html" do
    recursive true
    mode '0755'
  end
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source 'conf.erb'
    mode '0644'
    variables(document_root: "/srv/apache/#{site_name}/html", port: site_port)
  end

  file "/srv/apache/#{site_name}/html/index.html" do
    content "<h1>Welcome #{site_name}!</h1>"
  end
end
action :remove do
  directory "/srv/apache/#{site_name}/html" do
    action :delete
  end
  file "/etc/httpd/conf.d/#{site_name}.conf" do
    action :delete
  end
end