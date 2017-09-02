require './Getuserinfo'

class Telephone_checker

  def self.ukrainian_only(num)
    if /(\+380)([\d]{9})/.match num
      num = num.gsub('+38','')

    elsif /(380)([\d]{9})/.match num
      num = num[2..11]
    end

    if num.length == 10 and (
    /([093])([\d]){9}/=~num or
      /([039])([\d]){9}/=~num or
      /([050])([\d]){9}/=~num or
      /([063])([\d]){9}/=~num or
      /([066])([\d]){9}/=~num or
      /([067])([\d]){9}/=~num or
      /([068])([\d]){9}/=~num or
      /([091])([\d]){9}/=~num or
      /([092])([\d]){9}/=~num or
      /([094])([\d]){9}/=~num or
      /([095])([\d]){9}/=~num or
      /([096])([\d]){9}/=~num or
      /([097])([\d]){9}/=~num or
      /([098])([\d]){9}/=~num or
      /([098])([\d]){9}/=~num
    )
      return num


    else
      return '0'
    end

  end
end

#a = Telephone_checker.ukrainian_only('380934938060')
#puts a
