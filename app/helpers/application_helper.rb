module ApplicationHelper
	def has_configs
		return @application.configs && @application.configs.length > 0
	end
end
