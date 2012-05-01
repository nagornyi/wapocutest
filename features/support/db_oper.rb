require 'rubygems'
require 'mysql'

class DbOper
	def initialize(host, username, password, dbname)
		@con = Mysql.new(host, username, password, dbname)
	end

	def query str
		#this is an example of database query method implementation
		rs = @con.query(str)
		users=[]
		rs.each_hash { |h| users << h['smth'] }
		users
	end

	def close_connection
		@con.close
	end
end

