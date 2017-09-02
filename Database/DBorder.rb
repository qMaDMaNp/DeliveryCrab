require 'sqlite3'

class DBorder

  def self.bd_input

    orderdate = Time.now
    @orderdate = orderdate.strftime("%H:%M-%d.%m.%Y")
    @restaurant = Global.restaurant
    @username = Global.client_name
    @phone_num = Global.client_phone
    @address = Global.client_address
    @userorder = Global.order_cart.join(', ')

    @db = SQLite3::Database.new 'DeliveryOrder'
    @db.execute 'create table if not exists
      "Users" (
          "id" Integer primary key autoincrement,
          "orderdate" Text,
          "restaurant" Text,
          "username" Text,
          "phone" Text,
          "address" Text,
          "userorder" Text
      )'

    @db.execute( 'INSERT INTO
      Users (
          orderdate,
          restaurant,
          username,
          phone,
          address,
          userorder
      )
      VALUES ( ?, ?, ?, ?, ?, ?)', [@orderdate, @restaurant, @username, @phone_num, @address, @userorder])

  end
end
