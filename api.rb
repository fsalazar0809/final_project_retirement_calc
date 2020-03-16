require 'uri'
require 'net/http'

url = URI("http://sandbox-api.bambu.life/client-login")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request["authorization"] = 'Bearer UvQOJaF2DYzvOqikKabfEiFetZwIHDG9'
request.body = "{\"countryInput\":\"united states\",\"monthlyIncome\":100,\"currentYear\":2020,\"age\":35,\"retirementAge\":62,\"inflationRate\":0.02,\"lifestyleQuestionArray\":[\"Rent or Mortgate\",\"Personal Expenses\",\"Auto Expenses\"],\"lifestyleAnswerArray\":[1000,800,500]}"
request.body = "{\"username\":\"fabi0809\",\"password\":\"helloo\"}"

response = http.request(request)
puts response.read_body







