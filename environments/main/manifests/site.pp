# Base System
include ns9_base
include ns9_base_security
include ns9_users
include ns9_firewall
include ns9_fail2ban
# include ns9_autoupdate

# Base base services
# include ns9_phpfpm
include ns9_nginx
include ns9_mysql
include ns9_monit
include ns9_letsencrypt

# Services
include ns9_owncloud
include ns9_cron
include ns9_smartrobot
