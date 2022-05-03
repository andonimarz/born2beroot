# born2beroot

	Particiones del bonus
	/boot			núcleo del SO + archivos de arranque.
	SWAP			en caso de no disponer de suficiente RAM la info del sistema se vuelca ahí.
	/home			archivos generales del usuario.
	/var			muestra los archivos que cambian de tamaño.
	/var/log		logs del sistema y de programas.
	/srv			ficheros relacionados con servidores web, FTP o cualquier otro dato del sistema.
	/tmp			archivos temporales como caché o historial de navegadores web.
	/root			directorio principal de la cuenta del admin.

	lsblk			Para ver particiones
	hostnamectl		Para mostrar/editar la info. 
				(Para cambiar hostname "hostname set-hostname <nuevo hostname>")
	su			abre un shell de superusuario que permite que los siguientes comandos tengan
				acceso de super usuario.
	sudo			ofrece una elevación de privilegios para un solo comando. También sirve para 
				ejecutar comandos como otros usuarios.
	apt			Advanced Packaging Tool. para administrar los paquetes de la distro. Permite 
				instalar, actualizar o borrar paquetes del sistema.
	dpkg			gestión de paquetes "-l" muestra la lista de instalados.
	SSH			Secure SHell. protocolo cuya función es el acceso remoto a un servidor por medio 
				de un canal seguro en el que la info está cifrada.
	UFW			Uncomplicated FireWall. bloquear accesos no autorizados a un ordenador mientras
				sigue permitiendo la comunicación de tu ordenador con otros servicios autorizados.
				(Para conectarse desde fuera de la MV "ssh <username>@<ip> -p <puerto>)
	libpam-pwquality:	herramientas de generación y testeo de contraseñas.
	visudo			Permite la edición del archivo de configuración de sudo sudoers.

	Explicación de monitoring.sh
	uname -a		arquitectura del SO ("-a" de all info)
	lscpu:			muestra info de la arquitectura de la cpu.
	free --mega		Muestra en MB la memoria libre, usada, total, etc.
	df -h			Informa del espacio usado. La "h" es de human readable, en MB, GB, etc.
	top -bn1		-n indica el número de iteraciones a mostrar. (En este caso 1)
				-b Batch mode. permite enviar la salida del comando a archivos o programas.
	who			información sobre quién está logeado.	-b  hora de último boot.
									-a  all.
	hostname		-a  alias, -d domain, -A all, -i  ip, -I all ip...
	ip -a			muestra/edita parámetros de red. "-a" address.
	LVM			administrador de volúmenes lógicos.
	pvdisplay		muestra propiedades físicas de cada volumen físico (tamaño, extensiones, grupo...)
	lsblk			lista de dispositivos de bloque, que son archivos especiales que hacen referencia
				o representan cualquier dispositivo del PC.
	crontab			permite automatizar tareas.	-e  para editar el archivo crontab.
								-l  para visualizar

	Claves de Shell de monitoring.sh
	#!/bin/bash		se usa al comienzo del script para indicar al SO que use bash como intérprete.    
	$(comando)		permite usar el resultado del comando entre paréntesis como una variable más.
	awk			herramienta/lenguaje que permite manipular información en linux.
		ej:	awk 'NR==5' {print $2}  muestra de la línea 5 el segundo elemento.
		ej2:	awk '$NF=="/"'          muestra las líneas cuyo último campo = "/". (NF = Nb of fields)
	grep <patrón>		Global Regular Expression Print. busca el patrón indicado a continuación.
	if [comando -gt0]	comprueba si el resultado del comando es mayor que 0.
	wc			cuenta el número de elementos. "-l" para líneas, "-w" palabras y "-c" bytes.
	
