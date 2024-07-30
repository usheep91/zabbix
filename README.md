## Summary
- sudo mv zabbix/scripts/*.sh /etc/zabbix/scripts
- sudo mv zabbix/zabbix_agentd.d/* /etc/zabbix/zabbix_agentd.d
- sudo service zabbix-agent restart


  ### Template
  Import template "zbx_Linux_Process.xml" in this repository

  ### Regex
  Set Regex for process discovery
  - Administration->General->Regular expressions
  - Name: Process for Linux Discovery
  - Expressions: ex) ^(<process_name>)($|[#][0-9]) [Result is TRUE]
  

### Refer to
https://usheep91.tistory.com/75
