#! /usr/bin/expect -f
set admin_password [lindex $argv 0 ]
set db_password [lindex $argv 1 ]
set timeout 10
spawn /usr/lpp/mmfs/4.1.1.1/installer/spectrumscale enable object
expect { 
  "y/N" { send "y\n"; exp_continue }
  "*Password:" { send "$admin_password\r"; exp_continue }
  "*Repeat Password:" { send "$admin_password\r"; exp_continue }
  "y/n" { send "n\n"; exp_continue }
  "*Password:" { send "$db_password\r"; exp_continue }
  "*Repeat Password:" { send "$db_password\r"; exp_continue }
}
