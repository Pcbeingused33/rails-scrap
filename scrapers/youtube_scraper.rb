require 'nokogiri'
require 'open-uri'
require 'byebug'
require '/home/ale/code/Pcbeingused33/content_media_trackr/app/controllers/parser_controller.rb'
require 'httparty'
require 'content_creators_controller'

url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{@content_creator.youtube}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request.body = "{\"module\":\"HtmlRequestScraper\"}"

response = http.request(request)
parsed_response = response.read_body

views = parsed_response.scan(/label(.*?)views/) # array
# a = [["\\\">227"], ["\\\">219"], ["\\\">230"], ["\\\">231"], ["\\\">247"], ["\\\">279"], ["\\\">262"], ["\\\">838"]]

z = views.map do |x|
  x.to_s.scan(/[0-9]+/)
end

byebug

views.map {|x| x.scan(/[0-9]+/)}

p z

# manipular json entrar en columna especifica
