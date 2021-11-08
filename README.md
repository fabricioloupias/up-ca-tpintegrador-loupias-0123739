# Documentacion configuración Topologia de red

## Firewall
En el archivo rules.ipv4.conf se encuentra la reglas iptables utilizadas para las restricciones.
En **/etc/network/if-up.d/iptables** se genero un bash ejecutable para cargar los iptables al inicio del servicio

* La politica por defecto para las cadenas de la tabla Filter es DROP
* Se creo tráfico input/output para la interfaz loopback
* Se creo comunicación input/output para el cliente-04 con web-server
* Se creo comunicación input/output para salida de internet en cliente-03
* Se creo comunicación por ssh desde el cliente02 al firewall

## Web-server
Encargado de levantar un servidor apache con una website de ejemplo.
* Se descomprimio el jdk y el tomcat en /opt
* Se seteo las variables de entorno JAVA_HOME, CATALINA_HOME en ~./bashrc
* Se agrego JAVA_HOME al PATH
* Dentro del directorio CATALINA_HOME/webapp se copio el sample.war
* Se agrego un enlace directo a startup.sh y shutdown.sh (ln -s) para utilizarlo con tomcat-up y tomcat-down

## DHCP
Servicio encargardo de asignar ips dinamicas dentro de un rango establecido. Para ver la configuracion de las ip que entrega, ingresar al archivo dhcpd.conf.

* Se instalo el servicio ISS DHCP
* Se configuro como interfaz ipv4 **enp0s3** en /etc/default/isc-dhcp-server
* Se configuro dhcpd.conf para establecer el rango de direcciones ip a entregar
* Se instaló el cliente DHCP en las maquinas cliente 05 y 06
* Se configuro en los clientes 05 y 06 para que reciban de este servicio las ip

## File-server
Servicio encargado de realizar backups de la carpeta /home del ciente 03

* Se creo un script en /media/disco_backups/backup_home_cliente-03.sh el cual contiene la sentencia para realizar el backup de la carpeta /home del cliente 03
* Se configuro sshpass para no necesitar el password ante cada ejecucion
* Se instaló rsync para sincronizar el backup
* Se creo la carpeta /media/disco_backups/logs en la que ante cada ejecucion del script se va a generar un archivo con el formato backup_home_cliente-03.sh_YYYY-mm-dd_HH-MM-SSZ.log guardando las salidas
