###################################################
# copyright 2014 Agus Kurniawan
# blog: http://blog.aguskurniawan.net
# email: agusk2007@gmail.com
###################################################


require 'mysql'

class MysqlDatabase
  def initialize(server,database,username,password)
    @svr = server
    @db = database
    @usr = username
    @pwd = password
  end

  def connect
    puts('connecting to mysql server..')
    mysql = Mysql.connect(@svr, @usr, @pwd, @db)
    puts('connected')
    mysql.close()
  end

  def create_data

  end

  def read_data

  end

  def update_data

  end

  def delete_data(id)

  end


end


db = MysqlDatabase.new('127.0.0.1','mydatabase','root','akurniawan')
db.connect()
