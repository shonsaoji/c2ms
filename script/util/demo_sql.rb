# require 'curb'
# require 'json'

require  File.expand_path File.dirname(__FILE__) + '/../../config/environment.rb'

application = Application.find_by_name('DEMO')

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





