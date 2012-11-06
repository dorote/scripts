echo -----START----------

echo ----start stopping VMs----

vmrun -T server -h https://servername:8333/sdk -u username -p userpass stop "[standard] Win2003_examp/Win2003_examp.vmx"

vmrun -T server -h https://servername:8333/sdk -u username -p userpass stop "[standard] WinXP_examp/WinXP_examp.vmx"

echo ----finish stopping VMs----

echo ----deleting old VMs----

echo Y | del "d:\Virtual Machines\Win2003_examp\*"                      
echo Y | del "d:\Virtual Machines\WinXP_examp\*"                      

echo ----copying new clean VMs----

copy "d:\Virtual Machines\Rezerv\Win2003_examp\*" "d:\Virtual Machines\Win2003_examp"
copy "d:\Virtual Machines\Rezerv\WinXP_examp\*" "d:\Virtual Machines\WinXP_examp"


echo ----start starting VMs----

vmrun -T server -h https://servername:8333/sdk -u username -p userpass start "[standard] Win2003_examp/Win2003_examp.vmx"

vmrun -T server -h https://servername:8333/sdk -u username -p userpass start "[standard] WinXP_examp/WinXP_examp.vmx"

echo ----finish starting VMs----