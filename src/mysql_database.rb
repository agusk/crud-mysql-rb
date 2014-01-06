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
    puts('connecting to mysql server..')
    mysql = Mysql.connect(@svr, @usr, @pwd, @db)
    puts('connected')

    puts('inserting 10 data...')
    stmt = mysql.prepare('insert into product(name,price,created) values (?,?,now())')

    i = 1
    while i<=10
      stmt.execute "product #{i}",0.34*i
      i += 1
    end
    puts('done')
    mysql.close()

  end

  def read_data


  end

  def update_data

  end

  def delete_data(id)


  end


end


db = MysqlDatabase.new('127.0.0.1','mydatabase','user','password')
db.connect()
db.create_data()
