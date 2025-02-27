MANAGER_USER="spacewalk"
MANAGER_PASS="spacewalk"
MANAGER_ADMIN_EMAIL="galaxy-noise@suse.de"
CERT_O="SUSE"
CERT_OU="SUSE"
CERT_CITY="Nuernberg"
CERT_STATE="Bayern"
CERT_COUNTRY="DE"
CERT_EMAIL="galaxy-noise@suse.de"
CERT_PASS="spacewalk"
{%- if grains.get('provider') == 'aws' %}
CERT_CNAMES="{{ grains.get('hostname') }}.{{ grains.get('domain') }}"
{%- endif %}
USE_EXISTING_CERTS="N"
MANAGER_DB_NAME="susemanager"
MANAGER_DB_HOST="{{ grains.get('db_configuration')['hostname'] }}"
MANAGER_DB_PORT="{{ grains.get('db_configuration')['port'] }}"
MANAGER_DB_PROTOCOL="TCP"
MANAGER_ENABLE_TFTP="Y"
SCC_USER="{{ grains.get("cc_username") }}"
SCC_PASS="{{ grains.get("cc_password") }}"
{%- if not grains.get('db_configuration')['local'] %}
EXTERNALDB_ADMIN_USER="{{ grains.get('db_configuration')['superuser'] }}"
EXTERNALDB_ADMIN_PASS="{{ grains.get('db_configuration')['superuser_password'] }}"
REPORT_DB_HOST="{{ grains.get('db_configuration')['hostname'] }}"
EXTERNALDB_PROVIDER="{{ grains.get('provider') }}"
REPORT_DB_PORT="{{ grains.get('db_configuration')['port'] }}"
REPORT_DB_NAME="reportdb"
REPORT_DB_USER="pythia_susemanager"
REPORT_DB_PASS="pythia_susemanager"
MANAGER_DB_CA_CERT="{{ grains.get('db_configuration')['certificate'] }}"
REPORT_DB_CA_CERT="{{ grains.get('db_configuration')['certificate'] }}"
{% endif %}
