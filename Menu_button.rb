require_relative 'Restaurants/Kovbasoff'
require_relative 'Restaurants/Farodelporto'
require './Getuserinfo'


class Menu_button

def self.main_menu(message, bot)

  Global.order_cart = []

  text = 'Выбирай что хочешь =) Не стесняйся'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: '🍱Суши-бары🍣'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🍝Пиццерии🍕'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🍷Рестораны🍖'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🍞Кафе🍲'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🍺Пабы, Бары🥓'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🍤Все заведения🌮')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when '🍱Суши-бары🍣'
        Menu_button.sushi_menu(message, bot)

      when '🍝Пиццерии🍕'
        Menu_button.pizza_menu(message, bot)

      when '🍷Рестораны🍖'
        Menu_button.restor_menu(message, bot)

      when '🍞Кафе🍲'
        Menu_button.cafe_menu(message, bot)

      when '🍺Пабы, Бары🥓'
        Menu_button.pub_menu(message, bot)

      when '🍤Все заведения🌮'
        Menu_button.all_menu(message, bot)

    end
  end

end

def self.sushi_menu(message, bot)

  text = 'Суши =)'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'Сушия'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Fugu'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Yoshi Fujiwara'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when 'Kovbasoff'
        Kovbasoff.menu_res(message, bot)
      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end

end

def self.pizza_menu(message, bot)

  text = 'С сирком =)'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'New York Street Pizza'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Прима Фелічіта'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Браво'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end
end

def self.restor_menu(message, bot)

  text = 'За винишком? =)'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'Faro Del Porto'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Forest'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Соборный'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when 'Faro Del Porto'
        Farodelporto.menu_res(message, bot)

      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end
end

def self.cafe_menu(message, bot)

  text = 'Просто посидеть =)'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'Servant'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Botanica'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Стумари'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end
end

def self.pub_menu(message, bot)

  text = 'Пивка для рывка =)'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'Ковбасофф'),
    Telegram::Bot::Types::KeyboardButton.new(text: '1+1'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Oblako'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when 'Кофбасофф'
        Kovbasoff.menu_res(message, bot)

      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end
end

def self.all_menu(message, bot)
  text = 'Все, так все'
  buttons = [
    Telegram::Bot::Types::KeyboardButton.new(text: 'Botanica'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Faro Del Porto'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Forest'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Fugu'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'New York Street Pizza'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Oblako'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Servant'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Yoshi Fujiwara'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Браво'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Ковбасофф'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Прима Фелічіта'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Сушия'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Соборный'),
    Telegram::Bot::Types::KeyboardButton.new(text: 'Стумари'),
    Telegram::Bot::Types::KeyboardButton.new(text: '1+1'),
    Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
  ]
  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons, one_time_keyboard: true, resize_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: "#{text}", reply_markup: markup)

  bot.listen do |message|

    Live_communication.list(message, bot)

    case message.text

      when '/start'
        Menu_button.main_menu(message, bot)

      when 'Ковбасофф'
        Kovbasoff.menu_res(message, bot)

      when 'Faro Del Porto'
        Farodelporto.menu_res(message, bot)

      when '🔙Назад в меню'
        Menu_button.main_menu(message, bot)

    end
  end
end

def self.stop_button(message, bot)

  stop_button = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
  bot.api.send_message(chat_id: message.chat.id, text: 'Для заказа напишите /start', reply_markup: stop_button)
  Global.order_table_time = nil
  Global.client_address = nil
  Global.order_quantity = nil
  Global.order_cart = []
  Global.restaurant = nil

end

end
