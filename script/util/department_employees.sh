
configs=$(curl -s "http://localhost:3000/applications/5/configs?keys=EXPERIENCE")
echo $configs
EXPERIENCE="8"
sql="SELECT p.name as 'Product Name', e.name as Employee, e.title as Title, e.experience as Experience, d.name as Department, b.name as 'Business Unit' FROM products p JOIN employees e ON p.department_id=e.department_id JOIN departments d on e.department_id=d.id JOIN business_units b ON d.business_unit_id=b.id WHERE e.experience >= $EXPERIENCE;" 

mysql \
-uroot \
-psk4scrappers \
-\-socket=$MYSQL_SOCKET -D c2ms_development \
-e "$sql"

ret=$?
if [ $ret -eq 0 ]
then
	echo "Command Executed Successfully!"
fi
