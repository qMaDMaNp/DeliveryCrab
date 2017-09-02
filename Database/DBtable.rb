require 'sqlite3'

class DBtable

  def self.bd_input

    orderdate = Time.now
    @orderdate = orderdate.strftime("%H:%M-%d.%m.%Y")
    @restaurant = Global.restaurant
    @username = Global.client_name
    @phone = Global.client_phone
    @order_table_time = Global.order_table_time
    @order_table_day = Global.order_table_day
    @order_table_month = Global.order_table_month


    @db = SQLite3::Database.new 'TableOrders'
    @db.execute 'create table if not exists
      "Users" (
          "id" Integer primary key autoincrement,
          "orderdate" Text,
          "restaurant" Text,
          "username" Text,
          "phone" Text,
          "tableday" Text,
          "tabletime" Text,
          "month" Text
      )'

    @db.execute( 'INSERT INTO
      Users (
          orderdate,
          restaurant,
          username,
          phone,
          tableday,
          tabletime,
          month
      )
      VALUES ( ?, ?, ?, ?, ?, ?, ?)', [@orderdate, @restaurant, @username, @phone, @order_table_day, @order_table_time, @order_table_month])

  end
end







