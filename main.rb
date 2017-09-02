require 'telegram/bot'
require './Menu_button'

token = '438804914:AAG8VciXU5aRh9JeXYiOnO5ZCOnan6V7uco'


module Global

  class << self
    attr_accessor :order_table_time,
                  :order_table_day,
                  :client_name,
                  :client_phone,
                  :client_address,
                  :order_quantity,
                  :client_st_name,
                  :client_st_num,
                  :order_cart,
                  :restaurant,
                  :order_table_month
  end
end
Global.order_cart = []

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
      when '/start'
        Menu_button.main_menu(message, bot)

      when "/help"
        bot.api.send_message(chat_id: message.chat.id, text: 'Нуждаешься в помощи? Давай подскажу.

⚫️Для поиска любимого заведения начни свою фразу с "где находиться". Например, где находиться Фаро дель порто?

⚫️Для более подробной информации о блюде/ресторане, твоя фраза должна содержать "что такое". Например, что такое Пицца Цезарь?

⚫️Или укажи название. Например, Фаро дель порто?

⚫️Обязательно поставь знак вопроса! ')

        Global.order_table_time = nil
        Global.client_name = nil
        Global.client_phone = nil
        Global.client_address = nil
        Global.order_quantity = nil
        Global.order_cart = []
        Global.restaurant = nil
    end
  end
end

