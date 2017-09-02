require 'net/http'
require 'json'

class Address_checker

  def self.url(street, number)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=украина,черкассы,#{street},#{number}&key=AIzaSyDEhIhQZ_Nr-gSrnL9eNT-YM6nHF2YECbM"
    url = normalize_uri(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
    if response.include? "ZERO_RESULTS"
      return "Нет такой улицы"
    else
      return "Есть такая улица"
    end
  end

  def self.normalize_uri(uri)
    return uri if uri.is_a? URI
    uri = uri.to_s
    uri, *tail = uri.rpartition "#" if uri["#"]

    URI(URI.encode(uri) << Array(tail).join)

  end

end
#Address_checker.url("зфвп", 7)
