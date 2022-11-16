# born2beroot

#### My personal doc for the born2beroot defense

### Particiones (bonus incluido)

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

### Crontab y monitoring.sh

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

### Claves de Shell de monitoring.sh

	#!/bin/bash		se usa al comienzo del script para indicar al SO que use bash como intérprete.    
	$(comando)		permite usar el resultado del comando entre paréntesis como una variable más.
	awk			herramienta/lenguaje que permite manipular información en linux.
	
		ej:	awk 'NR==5' {print $2}  muestra de la línea 5 el segundo elemento.
		ej2:	awk '$NF=="/"'          muestra las líneas cuyo último campo = "/". (NF = Nb of fields)
	
	grep <patrón>		Global Regular Expression Print. busca el patrón indicado a continuación.
	if [comando -gt0]	comprueba si el resultado del comando es mayor que 0.
	wc			cuenta el número de elementos. "-l" para líneas, "-w" palabras y "-c" bytes.

### Conceptos principales del proyecto

#### Comprobar que signature.txt coincide con el .vdi

En sgoinfre hay que poner shasum born2beroot.vdi. Los archivos vdi son los que usa virtual box para almacenar el contenido que las MV perciben como sus discos duros. Se utilizan para crear imágenes del disco virtual.

#### MV¿Qué es?

Una máquina virtual es un recurso que usa software en lugar de otro ordenador físico para ejecutar programas y desplegar aplicaciones. Cada máquina virtual utilizará un sistema operativo y unas apps separadas de otras MV. Las MV funcionan mediante una tecnología de “virtualización” que simula un hardware virtual que permite a las MV ejecutarse. Se pueden usar para probar diferentes niveles de potencia o apps en un entorno seguro.

#### ¿Por qué Debian?

Centos está más orientado a gestión de servicios y Debian a usuarios. Debian es más sencillo de instalar y configurar.
En el subject se recomienda si se carece de experiencia en administración de sistemas.

#### Diferencias entre aptitude y apt

Ambos son gestores de paquetes que permiten instalar, eliminar, buscar, etc. Sin embargo, aptitude es más avanzada agregando una interfaz de usuario y teniendo más funciones que apt como por ejemplo marcar un paquete para que se instale automáticamente o para que no se actualice..
Aptitude es un administrador de paquetes de alto nivel y apt de nivel inferior (puede ser usado por administradores de nivel superior).
Al eliminar un paquete, aptitude elimina paquetes no utilizados por defecto mientras que con apt hay que especificarlo con -auto-remove.
A la hora de buscar, aptitude solo busca por el nombre y apt busca programas que guardan relación con el nombre.

#### SELinux

Security-Enhanced Linux. Un modulo de seguridad de Linux que permite mayor control de acceso a los administradores. Define los controles de acceso a las aplicaciones, los procesos y los archivos dentro de un sistema.

#### AppArmor

Es similar a SELinux, aunque funciona de forma diferente. Restringe las acciones que pueden realizar los procesos. Por ejemplo, a un visor PDF le da acceso solo a las cosas necesarias para su funcionamiento, restringiéndole lo demás.
sudo apparmor_status

#### Comprobar el hostname

Se comprueba con “hostnamectl”. Para cambiar el nombre “hostnamectl set-hostname <newname>” o cambiando el archivo “sudo nano /etc/hosts” y reboot.

#### LVM ¿Cómo funciona y qué es?

	Para ver las particiones	lsblk

Logic Volume Manager. Es un sistema de gestión de volúmenes soportado por Linux que permite gestionar el espacio de almacenamiento con más flexibilidad. Se puede aumentar el tamaño de las particiones independientemente de que haya o no espacio libre contiguo. También permite mover volúmenes lógicos entre dispositivos físicos y elegir el nombre de los componentes.

#### Comandos para apartado de usuarios

	Crear usuario	useradd <username>
	Borrar usuario	userdel -r <username>
	Añadir pass	sudo passwd <username>
	Crear grupo	addgroup <groupname>
	Añadir a grupo	addgroup <username> <groupname>
				sudo usermod -a -G <groupname> <username>
	Grupos de…	groups <username>
	Info de pass	sudo chage -l <username>

	Users in group	getent group <groupname>
	Local users	cut -d: -f1 /etc/passwd

#### PASS

	Caducidad	sudo nano /etc/login.defs (passwd aging controls)
	Fuerte		sudo nano /etc/pam.d/common-password
					minlen=10			mínimo 10 caracteres
					ucredit=-1			mínimo 1 uppercase
					lcredit=-1			mínimo 1 lowercase
					maxrepeat=3		máximo 3 caracteres consecutivos iguales
					reject_username	no puede contener el username
					difok=7			mínimo 7 cambios de la anterior
					enforce_for_root	mismas condiciones en root.
	Fuerte sudo	sudo visudo o sudo nano /etc/sudoers.d/sudo_config
					passwd_tries=3		reintentos
					badpass_message=“”
					logfile=“/var/log/sudo/sudo_log”
					requirente			modo tty activado por seguridad
					secure_path=“”		directories restringidos por sudo

#### Ventajas y desventajas política fuerte de contraseñas

Ante un ataque DDos los bots tardan más en dar con tu contraseña y  el servidor tiene más tiempo para frenar el ataque.
Desventaja: más incómodo para el usuario.

#### SSH

	SSH			protocolo/programa cuya función es el acceso remoto a un servidor por medio de un canal seguro en el que la info está cifrada.
	Estado		sudo service ssh status
	Config file		ssh /etc/ssh/sshd_config
	Conectar		ssh amarzana@10.13.249.178 -p 4242

#### UFW

	Estado		sudo ufw status
				Puerto 4242 		SSH
				Puerto 80			mariaDB para Wordpress
				Puerto 21			FTP
	Habilitar/dis	sudo ufw enable/disable
	Abrir puerto	sudo ufw allow <portnb>
	Cerrar puerto	sudo ufw deny <portnb>
	Borrar puerto	sudo ufw  status numbered y sudo ufw delete <nb>

#### Cron

Cron			Herramienta predeterminada de linux que automatiza tareas/procesos periodicamente.
Crontab		Archivo de texto que establece reglas para cron.

#### FTP

FTP			File Transfer Protocol. Herramienta para mover info al servidor en el que se aloja un sitio web.
Comprobar	dpkg -l | grep vsftpd
Conectar		En el navegador ftp://10.13.249.178

Wordpress	http://10.13.249.178
