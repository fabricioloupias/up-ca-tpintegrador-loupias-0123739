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



