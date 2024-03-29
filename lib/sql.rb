require 'csv'
class Sql
	def list
		out = `ls #{Rails.root}/script/util`
		return out.split("\n")
	end

	def execute (script)
		env = Rails.env
		Rails.logger.debug "-------- #{env} ---------"
		f = "#{Rails.root}/script/util/#{script}"
		out = `RAILS_ENV=#{env} ruby #{f} &`
		out_lines = out.split("\n")
		Rails.logger.debug out_lines
		results = []
		keys = []
		count = 0
		out_lines.each do |line|
			line.gsub!(/\"/,"")
			
			vals = line.split('\t')
			if(count == 0) 
				keys = vals
			else
				res = {}
				i = 0
				while i < vals.length do
					res[keys[i]] = vals[i]
					i = i + 1
				end
				results << res
			end
			count = count + 1
		end		
		results
	end
end