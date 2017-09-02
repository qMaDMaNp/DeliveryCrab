class Live_communication

  def self.list(message, bot)
    a = message.text.to_s.downcase
    case a

      when "что такое пицца цезарь?", "пицца цезарь?", "что в пицце цезарь?", "информация о пицце цезарь"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%80%D0%B1%D0%BE%D0%BD%D0%B0%D1%80%D0%B0'
        )
        lable = 'Информация о пицце Цезарь'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое пицца гавайская?", "пицца гавайская?", "что в пицце гавайской?", "информация о пицце гавайская"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B8%D1%86%D1%86%D0%B0'
        )
        lable = 'Информация о пицце Гавайская'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое тирамису?", "тирамису?", "что в тирамису?", "информация о тирамису"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%A2%D0%B8%D1%80%D0%B0%D0%BC%D0%B8%D1%81%D1%83'
        )
        lable = 'Информация о Тирамису'
        Live_communication.buttons(message, bot, button, lable)

      when "где находится фародельпорто?", "где находится фаро дель порто?", "где найти фародельпорто?", "как добраться до фародельпорто?","фародельпорто?", "где находится faro del porto?", "где найти faro del porto?"
        bot.api.send_location(chat_id: message.chat.id, latitude: 49.4382227, longitude: 32.0983949)

      when "где находится ковбасофф?", "где найти ковбасофф?", "как добраться до ковбасофф?"
        bot.api.send_location(chat_id: message.chat.id, latitude: 49.440756, longitude: 32.070047)

      when "что такое ковбасофф?", "ковбасофф?", "информация о ковбасофф"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://crabservers.herokuapp.com/html/FD13_Kovbasoff.html'
        )
        lable = 'Информация о баре "Ковбасофф"'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое фародельпорто?", "фародельпорто?", "информация о фародельпорто", "фаро дель порто", "что такое faro del porto?", "информация о faro del porto"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://crabservers.herokuapp.com/html/FD7_Faro.html'
        )
        lable = 'Информация о ресторане "Faro del porto"'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое фрикупелики?", "фрикупелики?", "информация о фрикупеликах"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: '80%D0%B0'
        )
        lable = 'Информация о фрикупеликах'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое лимончелло?", "лимончелло?", "информация о лимончелло"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D0%BC%D0%BE%D0%BD%D1%87%D0%B5%D0%BB%D0%BB%D0%BE'
        )
        lable = 'Информация о лимончелло'
        Live_communication.buttons(message, bot, button, lable)

      when "что такое пицца гарибальди?", "пицца гарибальди?", "что в пицце гарибальди?", "информация о пицце гарибальди"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'http://yo-pizza.com.ua/product.php?id_product=96'
        )
        lable = 'Информация о пицце Гарибальди'
        Live_communication.buttons(message, bot, button, lable)
      when "какое лучшее светлое пиво?", "какое пиво выбрать?", "светлое жигулевское?", "уманское жигулевское?"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%96%D0%B8%D0%B3%D1%83%D0%BB%D1%91%D0%B2%D1%81%D0%BA%D0%BE%D0%B5'
        )
        lable = 'Информация о Уманское Жигулевское'
        Live_communication.buttons(message, bot, button, lable)

      when "медовое пиво?", "микулинецкое медовое пиво?", "микулинецкое?"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D0%B4%D0%BE%D0%B2%D1%8B%D0%B5_%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8#.D0.A1.D0.B1.D0.B8.D1.82.D0.B5.D0.BD.D1.8C'
        )
        lable = 'Информация о Микулинецкое медовое пиво'
        Live_communication.buttons(message, bot, button, lable)

      when "как это нефильтрованное пиво?", "нефильтрованное пиво?", "бердичевское?"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B8%D0%B2%D0%BE'
        )
        lable = 'Информация о нефильтрованное Бердичев'
        Live_communication.buttons(message, bot, button, lable)


      when "дункель?", "что такое дункель?"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'https://carlsbergukraine.com/ru/nashi-brendy/l-vovskoe/l-vovskoe-dunkel/'
        )
        lable = 'Информация о Дункель'
        Live_communication.buttons(message, bot, button, lable)

      when "пивной жираф?", "что такое пивной жираф?"
        button = Telegram::Bot::Types::InlineKeyboardButton.new(
          text: 'Нажми меня',
          url: 'http://www.magnum-beer.com/2010/08/20.html'
        )
        lable = 'Информация о пивной жираф'
        Live_communication.buttons(message, bot, button, lable)

    end

  end

  def self.buttons(message, bot, button, lable)
    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button)
    bot.api.send_message(chat_id: message.chat.id, text: lable, reply_markup: markup)
  end
end
