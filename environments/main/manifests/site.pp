# Base System
include ns9_base
include ns9_base_security
include ns9_users
include ns9_firewall
include ns9_fail2ban
# include ns9_autoupdate

# Base base services
include ns9_phpfpm
include ns9_nginx
include ns9_mysql
include ns9_monit

# Services
include ns9_owncloud
