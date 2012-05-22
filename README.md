Parcial TELEMATICA
==================


DANIEL MUNERA SANCHEZ

El parcial consistio de dos aplicaciones:

==> El integrador => RAILS APPLICATION
==> Worker => RAILS APPLICATION

LIBRERIAS UTILIZADAS
====================

* net/http
* hpricot
* json
* rails y dependencias

EL INTEGRADOR
=============

1. Datos generales
-------------------

La primera es la aplicacion donde se encuentra el buscador, desde alli se pueden lanzar busquedas de palabras
en los documentos que estan en los servidores de las aplicaciones workers. Todos los workers tienen una replica
de los mismos archivos.

La respuesta de los workers es en formato JSON:

**{"info":{"url":URL del servidor que responde ,"info": "informacion de los documentos que fueron encontrados"}}**

2. Para ejecutar
-----------------

Ingresar a la carpeta parcial y ejecutar para instalar todos los requerimientos. 
<code>bundle install 

Para correr la aplicación y en caso de haber un problema lo repotara.

Luego ejecutar el comando para crear la base de datos:

<code>rake db:migrate<code> 
	

	
Finalmente ejecute el siguiente comando para iniciar el servidor:

<code>rails s

Y desde su navegador vaya a la direccion **http://localhost:3000** 
	
	
WORKERS
=======

1. Datos generales
-------------------

El archivo de configuracion de los workers esta en la carpeta config y es de la forma

<code>
	worker: 
	    docs:
	        reto1:
	            name: 'reto1.pdf'            
	            dic:
	                palabra: '10'
	                el: '50'
	                buenas: '50'
	                hola: '50'
	        reto2:
	            name: 'reto2.pdf'
	            dic:
	                hola: '20'
	                los: '15'
	
</code>

Alli se subscriben los archivos que estan en el servidor. NOTA: es una simulacion pero se pueden mostrar los archivos porque
fueron ubicados den la carpeta public/datos



2. Para ejecutar
-----------------

Ingresar a la carpeta parcial y ejecutar para instalar todos los requerimientos. 
<code>bundle install 

Para correr la aplicación y en caso de haber un problema lo repotara.

Luego ejecutar el comando para crear la base de datos:

<code>rake db:migrate<code> 
	

	
Finalmente ejecute el siguiente comando para iniciar el worker:

<code>rails s -p < el puerto por donde se va a escuchar >


Los workers estan configurados en la aplicacion **Integrador** con los siguientes puertos  el la carpeta config/

<code>
<?xml version='1.0'>
<servidores>
<servidor>http://localhost:2022/searchWS</servidor>
<servidor>http://localhost:2020/searchWS</servidor>
<servidor>http://localhost:8082/searchWS</servidor>
</servidores>
</code>

Si desea iniciar los workers en otros puertos debe actualizar el archivo.






