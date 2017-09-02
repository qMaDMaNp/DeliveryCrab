require './Database/DBorder'
require './Database/DBtable'
require './Getuserinfo'
require './Livecom'
require './Parser'
class Farodelporto

  class << self
    attr_accessor :table_11_13,
                  :table_14_16,
                  :table_17_19,
                  :table_20_23,
                  :likes5,
                  :likes4,
                  :likes3,
                  :likes2,
                  :likes1
  end

  @table_11_13 = []
  @table_14_16 = []
  @table_17_19 = []
  @table_20_23 = []
  @likes5 = []
  @likes4 = []
  @likes3 = []
  @likes2 = []
  @likes1 = []

  def self.menu_res(message, bot)

    Global.restaurant = "Farodelporto"

    text = 'Вы к нам или мы к вам ?'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: '📦Доставка🛵'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🕯Заказать столик📝'),
      Telegram::Bot::Types::KeyboardButton.new(text: '💙Отзывы💜'),
      Telegram::Bot::Types::KeyboardButton.new(text: '❓Где нас найти?❓'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when '📦Доставка🛵'
          Farodelporto.delivery(message, bot)

        when '🕯Заказать столик📝'
          Farodelporto.order_table_month(message, bot)

        when '💙Отзывы💜'
          Farodelporto.res_likes(message, bot)

        when '❓Где нас найти?❓'
          bot.api.send_location(chat_id: message.chat.id, latitude: 49.438237, longitude: 32.098387)
          Farodelporto.menu_res(message, bot)


        when '🔙Назад в меню'
          Menu_button.main_menu(message, bot)

      end
    end
  end

  def self.delivery(message, bot)

    text = 'Значит заказываем =)'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Пицца'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Десерты'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Напитки'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Пицца'
          Parser.faro_del_porto_pizza(message, bot)

        when 'Десерты'
          Parser.faro_del_porto_desserts(message, bot)

        when 'Напитки'
          Parser.faro_del_porto_drinks(message, bot)


        when '🔙Назад'
          Farodelporto.menu_res(message, bot)

      end
    end
  end

  def self.pizza(message, bot, buttons)

    text = 'Ууу піцца, вкусняшка'

    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Пицца "Цезарь"'
          Global.order_cart.push('Цезарь')
          Farodelporto.pizza_quantity(message, bot)

        when 'Пицца "Гарибальди"'
          Global.order_cart.push('Гарибальди')
          Farodelporto.pizza_quantity(message, bot)

        when 'Пицца "Кватро Формаджи"'
          Global.order_cart.push('Кватро Формаджи')
          Farodelporto.pizza_quantity(message, bot)


        when '🔙Назад в меню'
          Farodelporto.delivery(message, bot)

      end
    end
  end

  def self.desserts(message, bot, buttons)

    text = 'Ууу сладенькое, вкусняшка'

    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Десерт "Лимончелла"'
          Global.order_cart.push('Лимончелла')
          Farodelporto.pizza_quantity(message, bot)

        when 'Десерт "Чернично-арахисовый"'
          Global.order_cart.push('Гарибальди')
          Farodelporto.pizza_quantity(message, bot)

        when 'Десерт "Яблочный тартатен"'
          Global.order_cart.push('Яблочный тартатен')
          Farodelporto.pizza_quantity(message, bot)


        when '🔙Назад'
          Farodelporto.delivery(message, bot)

      end
    end
  end

  def self.drinks(message, bot, buttons)

    text = 'Ууу сладенькое, вкусняшка'

    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Вода "Borjomi"'
          Global.order_cart.push('Borjomi')
          Farodelporto.pizza_quantity(message, bot)

        when 'Вода "Моршинская"'
          Global.order_cart.push('Моршинська')
          Farodelporto.pizza_quantity(message, bot)

        when 'Сок "Sandora" в ассортименте'
          Global.order_cart.push('Sandora')
          Farodelporto.pizza_quantity(message, bot)


        when '🔙Назад'
          Farodelporto.delivery(message, bot)

      end
    end
  end

  def self.pizza_quantity(message, bot)

    text = 'Количество пожалуйста'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: '1'), Telegram::Bot::Types::KeyboardButton.new(text: '2'),
      Telegram::Bot::Types::KeyboardButton.new(text: '3'), Telegram::Bot::Types::KeyboardButton.new(text: '4'),
      Telegram::Bot::Types::KeyboardButton.new(text: '5'), Telegram::Bot::Types::KeyboardButton.new(text: '6'),
      Telegram::Bot::Types::KeyboardButton.new(text: '7'), Telegram::Bot::Types::KeyboardButton.new(text: '8'),
      Telegram::Bot::Types::KeyboardButton.new(text: '9'), Telegram::Bot::Types::KeyboardButton.new(text: '10'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when '1'
          Global.order_quantity = '1'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '2'
          Global.order_quantity = '2'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '3'
          Global.order_quantity = '3'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '4'
          Global.order_quantity = '4'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '5'
          Global.order_quantity = '5'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '6'
          Global.order_quantity = '6'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '7'
          Global.order_quantity = '7'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '8'
          Global.order_quantity = '8'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '9'
          Global.order_quantity = '9'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '10'
          Global.order_quantity = '10'
          Global.order_cart.push(Global.order_quantity)
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш заказик: #{Global.order_cart.join(', ')}")
          Farodelporto.last_step(message, bot)

        when '🔙Назад'
          Farodelporto.delivery(message, bot)

      end
    end
  end

  def self.last_step(message, bot)

    text = 'Оформляем? Или еще что-то ?'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Оформить заказ'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Заказать еще'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Отменить заказ')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Заказать еще'
          Farodelporto.delivery(message, bot)

        when 'Оформить заказ'
          Getuserinfo.user_info(message, bot)
          Getuserinfo.get_client_address(message, bot, 0)


        when 'Отменить заказ'
          Global.restaurant = nil
          Global.order_quantity = nil
          Global.order_cart = nil
          Menu_button.main_menu(message, bot)

      end
    end
  end

  def self.order_confirmation(message, bot)

    text = 'Если все верно, жмите Принять заказ'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Принять заказ'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Отменить заказ')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)
    bot.api.send_message(chat_id: message.chat.id,
                         text: "
Ресторан: #{Global.restaurant}
Имя: #{Global.client_name}
Телефон: #{Global.client_phone}
Адрес: #{Global.client_address}
Заказ: #{Global.order_cart.join(', ')}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Принять заказ'
          DBorder.bd_input
          bot.api.send_message(chat_id: message.chat.id, text: 'Спасибо за заказик, мы скоро приедем =)')
          Menu_button.stop_button(message, bot)

        when 'Отменить заказ'
          Global.restaurant = nil
          Global.order_quantity = nil
          Global.order_cart = nil
          Menu_button.main_menu(message, bot)

      end
    end
  end

  def self.order_table_month(message, bot)

    text = 'Выберите месяц'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Август'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Сентябрь'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Август'
          Global.order_table_month = 'Август'
          Farodelporto.order_table_day(message, bot)

        when 'Сентябрь'
          Global.order_table_month = 'Сентябрь'
          Farodelporto.order_table_day(message, bot)

        when '🔙Назад'
          Farodelporto.delivery(message, bot)

      end
    end
  end

  def self.order_table_day(message, bot)

    b_reaction_arr = 1..28
    b_reaction_arr = b_reaction_arr.to_a
    b_reaction_arr = b_reaction_arr.to_s

    text = 'На какое число?'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: '1'),  Telegram::Bot::Types::KeyboardButton.new(text: '2' ),
      Telegram::Bot::Types::KeyboardButton.new(text: '3'),  Telegram::Bot::Types::KeyboardButton.new(text: '4'),
      Telegram::Bot::Types::KeyboardButton.new(text: '5'),  Telegram::Bot::Types::KeyboardButton.new(text: '6'),
      Telegram::Bot::Types::KeyboardButton.new(text: '7'),  Telegram::Bot::Types::KeyboardButton.new(text: '8'),
      Telegram::Bot::Types::KeyboardButton.new(text: '9'),  Telegram::Bot::Types::KeyboardButton.new(text: '10'),
      Telegram::Bot::Types::KeyboardButton.new(text: '11'), Telegram::Bot::Types::KeyboardButton.new(text: '12'),
      Telegram::Bot::Types::KeyboardButton.new(text: '13'), Telegram::Bot::Types::KeyboardButton.new(text: '14'),
      Telegram::Bot::Types::KeyboardButton.new(text: '15'), Telegram::Bot::Types::KeyboardButton.new(text: '16'),
      Telegram::Bot::Types::KeyboardButton.new(text: '17'), Telegram::Bot::Types::KeyboardButton.new(text: '18'),
      Telegram::Bot::Types::KeyboardButton.new(text: '19'), Telegram::Bot::Types::KeyboardButton.new(text: '20'),
      Telegram::Bot::Types::KeyboardButton.new(text: '21'), Telegram::Bot::Types::KeyboardButton.new(text: '22'),
      Telegram::Bot::Types::KeyboardButton.new(text: '23'), Telegram::Bot::Types::KeyboardButton.new(text: '24'),
      Telegram::Bot::Types::KeyboardButton.new(text: '25'), Telegram::Bot::Types::KeyboardButton.new(text: '26'),
      Telegram::Bot::Types::KeyboardButton.new(text: '27'), Telegram::Bot::Types::KeyboardButton.new(text: '28'),
      Telegram::Bot::Types::KeyboardButton.new(text: '29'), Telegram::Bot::Types::KeyboardButton.new(text: '30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '31'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      time = Time.now
      month = time.strftime("%m")
      year = time.strftime("%Y")

      case message.text

        when '29'
          date = "#{month}" + "29/" + "#{year}"
          if  !/((02\/[0-2]\d)|((01|[0][3-9]|[1][0-2])\/(31|30|[0-2]\d)))\/[12]\d{3}/.match(date)
            bot.api.send_message(chat_id: message.chat.id, text: "В этом месяце нет такого дня", reply_markup: markup)
            Farodelporto.order_table_day(message, bot)
          else
            Global.order_table_day = message.text
            Farodelporto.order_table_time(message, bot)
          end

        when '30'
          date = "#{month}/" + "30/" + "#{year}"
          if  !/((02\/[0-2]\d)|((01|[0][3-9]|[1][0-2])\/(31|30|[0-2]\d)))\/[12]\d{3}/.match(date)
            bot.api.send_message(chat_id: message.chat.id, text: "В этом месяце нет такого дня", reply_markup: markup)
            Farodelporto.order_table_day(message, bot)
          else
            Global.order_table_day = message.text
            Farodelporto.order_table_time(message, bot)
          end

        when '31'
          date = "#{month}/" + "31/" + "#{year}"
          if  !/((02\/[0-2]\d)|((01|[0][3-9]|[1][0-2])\/(31|30|[0-2]\d)))\/[12]\d{3}/.match(date)
            bot.api.send_message(chat_id: message.chat.id, text: "В этом месяце нет такого дня", reply_markup: markup)
            Farodelporto.order_table_day(message, bot)
          else
            Global.order_table_day = message.text
            Farodelporto.order_table_time(message, bot)
          end

      end

      if b_reaction_arr.include?(message.text)
        Global.order_table_day = message.text
        Farodelporto.order_table_time(message, bot)
      else
        bot.api.send_message(chat_id: message.chat.id, text: 'нет такого дня ')
      end

    end
  end

  def self.order_table_time(message, bot)

    text = 'На какое время?'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: '11:00'), Telegram::Bot::Types::KeyboardButton.new(text: '11:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '12:00'), Telegram::Bot::Types::KeyboardButton.new(text: '12:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '13:00'), Telegram::Bot::Types::KeyboardButton.new(text: '13:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '14:00'), Telegram::Bot::Types::KeyboardButton.new(text: '14:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '15:00'), Telegram::Bot::Types::KeyboardButton.new(text: '15:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '16:00'), Telegram::Bot::Types::KeyboardButton.new(text: '16:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '17:00'), Telegram::Bot::Types::KeyboardButton.new(text: '17:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '18:00'), Telegram::Bot::Types::KeyboardButton.new(text: '18:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '19:00'), Telegram::Bot::Types::KeyboardButton.new(text: '19:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '20:00'), Telegram::Bot::Types::KeyboardButton.new(text: '20:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '21:00'), Telegram::Bot::Types::KeyboardButton.new(text: '21:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '22:00'), Telegram::Bot::Types::KeyboardButton.new(text: '22:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '23:00'), Telegram::Bot::Types::KeyboardButton.new(text: '23:30'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when '11:00'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '11:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '11:30'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '11:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '12:00'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '12:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '12:30'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '12:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '13:00'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '13:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '13:30'

          if Farodelporto.table_11_13.length <= 3
            Farodelporto.table_11_13.push('1')
            Global.order_table_time = '13:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '14:00'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '14:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '14:30'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '14:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '15:00'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '15:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '15:30'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '15:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '16:00'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '16:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '16:30'

          if Farodelporto.table_14_16.length <= 3
            Farodelporto.table_14_16.push('1')
            Global.order_table_time = '16:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '17:00'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '17:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '17:30'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '17:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '18:00'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '18:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '18:30'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '18:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '19:00'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '19:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '19:30'

          if Farodelporto.table_17_19.length <= 3
            Farodelporto.table_17_19.push('1')
            Global.order_table_time = '19:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '20:00'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '20:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '20:30'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '20:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '21:00'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '21:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '21:30'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '21:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '22:00'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '22:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '22:30'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '22:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '23:00'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '23:00'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '23:30'

          if Farodelporto.table_20_23.length <= 3
            Farodelporto.table_20_23.push('1')
            Global.order_table_time = '23:30'
            Farodelporto.time_confirmation(message, bot)
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'Свободных нет, может есть на другое время')
            Farodelporto.order_table_time(message, bot)
          end

        when '🔙Назад'
          Farodelporto.menu_res(message, bot)

      end
    end
  end

  def self.time_confirmation(message, bot)

    text = "На месяц #{Global.order_table_month}, день #{Global.order_table_day}, число #{Global.order_table_time} ?"
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Да'),
      Telegram::Bot::Types::KeyboardButton.new(text: 'Нет')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when 'Да'
          Getuserinfo.get_client_name(message, bot)
          bot.api.send_message(chat_id: message.chat.id, text: 'Введите пожалуйста ваш номер, для заказа столика =)')
          Getuserinfo.get_client_phone(message, bot)
          DBtable.bd_input
          bot.api.send_message(chat_id: message.chat.id, text: "Ваш столик ждет вас на #{Global.order_table_time} и мы тоже =)", reply_markup: markup)
          Menu_button.stop_button(message, bot)

        when 'Нет'
          Farodelporto.order_table_day(message, bot)


      end
    end
  end

  def self.res_likes(message, bot)

    text = 'Ууу піцца, вкусняшка'
    buttons = [
      Telegram::Bot::Types::KeyboardButton.new(text: '❤️💜💙❤️💜'),
      Telegram::Bot::Types::KeyboardButton.new(text: '❤️💜💙💜'),
      Telegram::Bot::Types::KeyboardButton.new(text: '❤️💜💙️'),
      Telegram::Bot::Types::KeyboardButton.new(text: '❤️❤️'),
      Telegram::Bot::Types::KeyboardButton.new(text: '❤️'),
      Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад')
    ]
    markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

    bot.listen do |message|

      Live_communication.list(message, bot)

      case message.text

        when '/start'
          Menu_button.main_menu(message, bot)

        when '❤️💜💙❤️💜'
          Farodelporto.likes5.push('5')
          bot.api.send_message(chat_id: message.chat.id, text: 'О да, мы настолько хороши =) Спасибо вам')
          Farodelporto.menu_res(message, bot)

        when '❤️💜💙💜'
          Farodelporto.likes4.push('4')
          bot.api.send_message(chat_id: message.chat.id, text: 'Почти 5 =) Спасибки')
          Farodelporto.menu_res(message, bot)

        when '❤️💜💙️'
          Farodelporto.likes3.push('3')
          bot.api.send_message(chat_id: message.chat.id, text: 'Триппл =)')
          Farodelporto.menu_res(message, bot)

        when '❤️❤️'
          Farodelporto.likes2.push('2')
          bot.api.send_message(chat_id: message.chat.id, text: 'Мы будем стараться лучше =) ')
          Farodelporto.menu_res(message, bot)

        when '❤️'
          Farodelporto.likes1.push('1')
          bot.api.send_message(chat_id: message.chat.id, text: 'Кажеться нам нужно очень сильно стараться =(')
          Farodelporto.menu_res(message, bot)

        when '🔙Назад'
          Farodelporto.menu_res(message, bot)

      end
    end
  end
end
