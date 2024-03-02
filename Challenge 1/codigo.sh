echo "crear maquina virtual"

read -p "ingresa el nombre de la maquina: " nombre
read -p "ingresa el arquitectura del sistema operativo de la maquina: " arq

VBoxManage createvm --name $nombre  --ostype $arq --register  --basefolder "/home/israel/virtualbox/"

echo "escribe el nombre, numero de cpus y tamaño de la memoria de la maquina virtual."



read -p "ingresa el nombre de la maquina: " nombreA
read -p "ingresa el numero de cpu que recibira la maquina virtual: " cpu
read -p "ingresa la memoria ram: "  ram

VBoxManage modifyvm $nombreA --cpus $cpu --memory $ram --vram 12


echo "configurar disco"


read -p "ingresa la memoria tamanio del disco duro: " hardis
VBoxManage createhd --filename /home/israel/virtualbox/Ubuntu-24-03-01-test/Ubuntu-24-03-01-test.vdi --size $hardis  --variant Standard



echo "configuracion del controlador el amacenamiento maquina virtual."

read -p "ingresa el nombre del controlador: " nombrecont

VBoxManage storagectl Ubuntu-24-03-01-test  --name "$nombrecont" --add sata --bootable on


echo "adjunta"
 
read -p "ingresa el nombre del controlador: " nombrecontrl


VBoxManage storageattach Ubuntu-24-03-01-test --storagectl  "$nombrecontrl"  --port 0 --device 0 --type hdd  --medium /home/israel/virtualbox/Ubuntu-24-03-01-test/Ubuntu-24-03-01-test.vdi


echo "IDE CONTROLLer"

read -p "ingresa el nombre del controlador IDE: " nombrecontrlid


VBoxManage storagectl Ubuntu-24-03-01-test --name "$nombrecontrlid"  --add ide


echo "muestra."

VBoxManage showvminfo Ubuntu-24-03-01-test
