require 'nokogiri'
require 'open-uri'
require 'byebug'
require '/home/ale/code/Pcbeingused33/content_media_trackr/app/controllers/parser_controller.rb'
require 'httparty'

p "Welcome to the social media scraper"
p "What Social Media platform do you want to know more about?"
p "Facebook, TikTok, Youtube"
social_media = gets.chomp.to_s
p "Please enter the user's url"
user_url = gets.chomp.to_s

# facebook :) (make tests tho)
if social_media == "Facebook"
  url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{user_url}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["accept"] = 'application/json'
  request["content-type"] = 'application/json'

  response = http.request(request)
  parsed_response = response.read_body

  views = parsed_response.scan(/"play_count(.*?)"total_posts/)

  result = views.map {|x| x.to_s.scan(/[0-9]+/)}
  final_result = result.flatten.map(&:to_i).sum
  p "#{final_result} views"
# tiktok :)
elsif social_media == "TikTok"
  url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{user_url}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["accept"] = 'application/json'
  request["content-type"] = 'application/json'
  request.body = "{\"module\":\"HtmlRequestScraper\"}"

  response = http.request(request)
  parsed_response = response.read_body

  views = parsed_response.scan(/e148ts222(.*?)</) # array
  result = views.map {|x| x.to_s.scan(/[0-9]+/)}
  final_result = result.flatten.map(&:to_i).sum

  p "#{final_result} views"
# youtube
elsif social_media == "Youtube"
  url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{user_url}")

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

  result.map do |array|
    if array.size == 2
      new_array = []
      new_array << array[0]
      new_array << array[1] * 100
      final_array = new_array.join.to_i
      total += final_array
    else
      total += array.join.to_i
    end
    total
  end

  final_result = result.flatten.map(&:to_i).sum

  p "#{final_result} views"

  # total = []
  # result.each {|views| views += total }
else
  "Please input one of the three social media platforms."
end
