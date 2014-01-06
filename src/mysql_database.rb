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
    puts('connecting to mysql server..')
    mysql = Mysql.connect(@svr, @usr, @pwd, @db)
    puts('connected')

    puts('retrieving all data')
    results = mysql.query('select idproduct,name,price,created from product')
    results.each do |idproduct,name,price,created|
      puts("#{idproduct}\t #{name}\t #{price}\t #{created}")
    end
    mysql.close()

  end

  def update_data(id)
    puts('connecting to mysql server..')
    mysql = Mysql.connect(@svr, @usr, @pwd, @db)
    puts('connected')

    puts("updating data id #{id}")
    stmt = mysql.prepare('update product set name=?,price=? where idproduct=?')
    # you can change these values
    stmt.execute 'product-updated',0.75,id
    puts('done')
    mysql.close()
  end

  def delete_data(id)
    puts('connecting to mysql server..')
    mysql = Mysql.connect(@svr, @usr, @pwd, @db)
    puts('connected')

    puts("deleting data id #{id}")
    stmt = mysql.prepare('delete from product where idproduct=?')
    stmt.execute id
    puts('done')
    mysql.close()
  end

end


db = MysqlDatabase.new('127.0.0.1','mydatabase','user','password')
db.connect()
db.create_data()
db.read_data()
db.update_data(24) # change this value
db.delete_data(25) # change this value
db.read_data()
