require 'nokogiri'
require 'open-uri'
require 'byebug'
require '/home/ale/code/Pcbeingused33/content_media_trackr/app/controllers/parser_controller.rb'
require 'httparty'

url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=https://www.youtube.com/@ItsOreylo")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request.body = "{\"module\":\"HtmlRequestScraper\"}"

response = http.request(request)
parsed_response = response.read_body

views = parsed_response.scan(/\\\"simpleText\\\":\\\"(.*?)views\\\"},\\\"navigationEndpoint\\\"/)

views2 = views.to_s.scan(/label(.*?)views/)
result = views2.map {|x| x.to_s.scan(/[0-9]+/)}
total = 0
#

result.map do |array|
  if array.size == 2
    new_array = []
    new_array << array[0]
    integer = array[1].to_i * 100
    new_array << integer.to_s
    final_array = new_array.join.to_i
    total += final_array
  else
    total += array.join.to_i
  end
  total
end

# final_result = result.flatten.map(&:to_i).sum

p "#{total} views"

# total_views = views.map {|x| x.scan(/[0-9]+/)}

# manipular json entrar en columna especifica
