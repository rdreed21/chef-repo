https://github.com/anniehedgpeth/hsworkstation.git

winrm quickconfig -q

winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'

winrm set winrm/config '@{MaxTimeoutms="1800000"}'

winrm set winrm/config/service '@{AllowUnencrypted="true"}'

winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in

localport=5985 action=allow

netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allownet stop winrm

sc config winrm start=auto

net start winrm