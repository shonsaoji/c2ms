# require 'curb'
# require 'json'

# http = Curl.get("http://localhost:3000/applications/5/configs?keys=EXPERIENCE")

# configs = JSON.parse(http.body_str) 
require  '/Applications/MAMP/htdocs/c2ms/config/environment.rb'
application = Application.find(5)

configs = application.configs

exp = configs.select { |c| c['key'] == 'EXPERIENCE' }[0]['value']

query = "SELECT p.name as 'Product Name', 
e.name as Employee, e.title as Title, 
e.experience as Experience, d.name as Department, 
b.name as 'Business Unit' FROM products p 
JOIN employees e ON p.department_id=e.department_id 
JOIN departments d on e.department_id=d.id 
JOIN business_units b ON d.business_unit_id=b.id 
WHERE e.experience >= #{exp};" 

out = `mysql -uroot -psk4scrappers --socket=$MYSQL_SOCKET -D c2ms_development -e "#{query}"`

output = out.split("\n")
if out
	output.each do |o|
	  p o
	end
else
	p "Script coult not execute successfully"
end





