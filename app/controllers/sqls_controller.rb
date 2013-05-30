class SqlsController < ApplicationController
	def index
		s = Sql.new
		@sqls = s.list
	end

	def execute_sql
		script = params[:script]
		@result = Sql.new.execute(script)
	end
end