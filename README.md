Parcial TELEMATICA
==================


DANIEL MUNERA SANCHEZ

El parcial consistio de dos aplicaciones:

* El integrador : RAILS APPLICATION
* Worker : RAILS APPLICATION

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

```json
{"info":{"url":URL del servidor que respondio ,
	"info": {:doc => nombre del archivo sin extension , :times => cuantas veces esta la palabra buscada,
	"name" => nombre del archivo, con definicion de formato para mostrarlo}}}
```

2. Para ejecutar
-----------------

Ingresar a la carpeta parcial y ejecutar para instalar todos los requerimientos. 
<code>bundle install 

Para correr la aplicación y en caso de haber un problema lo repotara.

	
Finalmente ejecute el siguiente comando para iniciar el servidor:

<code>rails s

Y desde su navegador vaya a la direccion **http://localhost:3000** 

NOTA: Para el problema del servidor donde tenia un problema con la gema execjs simplemente descomente en el 
Gemfile la gema

```ruby
	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
  	# gem 'therubyracer', :platform => :ruby	
```	

WORKERS
=======

1. Datos generales
-------------------

El archivo de configuracion de los workers esta en la carpeta config y el archivo se llama **worker.yml** y es
de la forma


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
	


Alli se subscriben los archivos que estan en el servidor. NOTA: es una simulacion pero se pueden mostrar los archivos
porque fueron ubicados den la carpeta **public/datos**



2. Para ejecutar
-----------------

Ingresar a la carpeta worker1 y ejecutar para instalar todos los requerimientos. 

<code>bundle install 

Para correr la aplicación y en caso de haber un problema lo repotara.

	
Finalmente ejecute el siguiente comando para iniciar el worker:

```ruby
rails s -p < el puerto por donde se va a escuchar >
```


Los workers estan configurados en la aplicacion **Integrador**  en la carpeta config/ encontrara un archivo llamado
workers.xml.
<blockquote>
```json
<xml version='1.0'>
<servidores>
<servidor>http://localhost:2022/searchWS</servidor>
<servidor>http://localhost:2020/searchWS</servidor>
<servidor>http://localhost:8082/searchWS</servidor>
</servidores>
```


Si desea iniciar los workers en otros puertos debe actualizar el archivo. Sino, solamente ingrese a la 
carpeta de workers y el siguiente comando

```ruby
rails s -p 2022
```








