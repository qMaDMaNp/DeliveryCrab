require 'nokogiri'
require 'open-uri'
require 'json'

class Parser
  def self.faro_del_porto_drinks(message, bot)
    url = 'https://crabservers.herokuapp.com/html/Katalog_Faro.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.drinks').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.drinks(message, bot, buttons)
  end

  def self.faro_del_porto_desserts(message, bot)
    url = 'https://crabservers.herokuapp.com/html/Katalog_Faro.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.sweet').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.desserts(message, bot, buttons)
  end

  def self.faro_del_porto_pizza(message, bot)
    url = 'https://crabservers.herokuapp.com/html/Katalog_Faro.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.pizza').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.pizza(message, bot, buttons)
  end

  def self.kovbasoff_meat(message, bot)
    url = 'https://crabservers.herokuapp.com/html/FD13_Kovbasoff.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.meat').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.pizza(message, bot, buttons)
  end

  def self.kovbasoff_drinks(message, bot)
    url = 'https://crabservers.herokuapp.com/html/FD13_Kovbasoff.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.drinks').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.pizza(message, bot, buttons)
  end

  def self.kovbasoff_snacks(message, bot)
    url = 'https://crabservers.herokuapp.com/html/FD13_Kovbasoff.html'
    html = open(url)
    doc = Nokogiri::HTML(html)
    @lables = []
    doc.css('.snacks').each do |showing|
      @lables = showing.css('p').map {|date| date.text.strip}
    end
    buttons = []
    @lables.each { |lable|
      buttons <<  Telegram::Bot::Types::KeyboardButton.new(text: lable)
    }
    buttons << Telegram::Bot::Types::KeyboardButton.new(text: '🔙Назад в меню')
    Farodelporto.pizza(message, bot, buttons)
  end
end
