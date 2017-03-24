# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

#inspec exec server.rb -t ssh://chefinspec.southcentralus.cloudapp.azure.com --password Ch3fP@ssword

describe file('/etc/ssh/sshd_config') do
  its('content') { should match /^Protocol 2/ }
end

describe directory ('/tmp') do
  it { should exist }
  it { should be_directory }
end

control '5.2.2' do
  impact 1.0
  title 'Ensure SSH Protocol is set to 2'
      desc <<-EOF
        SSH supports two different and incompatible protocols: SSH1 and SSH2.
        SSH1 was the original protocol and was subject to security issues.
        SSH2 is more advanced and secure.
        SSH v1 suffers from insecurities that do not affect SSH v2.
      EOF
      tag 'ssh', 'sshd', 'server', 'workstation'
      ref 'SSH Protocol', url: 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide...'
      describe sshd_config do
        its('Protocol') { should cmp 2 }
      end
end

#describe file('/tmp') do
#its('type') { should eq :directory }
#it { should be_directory }
#end

# describe service('MSSQLSERVER') do
#   it { should be_installed }
#   it { should be_enabled }
#   it { should be_running }
# end

# describe service('SQLSERVERAGENT') do
#   it { should be_installed }
#   it { should be_enabled }
#   it { should be_running }
# end
