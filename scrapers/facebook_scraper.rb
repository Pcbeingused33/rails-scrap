require 'nokogiri'
require 'open-uri'
require 'byebug'
# require '/home/ale/code/Pcbeingused33/content_media_trackr/app/controllers/parser_controller.rb'
require 'httparty'

# require 'contents_creator_controller'

# import { Controller } from "content_creators_controller.rb"

# url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=https://www.facebook.com/profile.php?id=100093008797392&sk=reels_tab")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# # cannot scrap reels properly
# request = Net::HTTP::Post.new(url)
# request["accept"] = 'application/json'
# request["content-type"] = 'application/json'

# response = http.request(request)
# parsed_response = response.read_body
# byebug
# views = parsed_response.scan(/"play_count(.*?)"total_posts/) # array
# # a = [["\\\">227"], ["\\\">219"], ["\\\">230"], ["\\\">231"], ["\\\">247"], ["\\\">279"], ["\\\">262"], ["\\\">838"]]
# result = views.map {|x| x.to_s.scan(/[0-9]+/)}
# final_result = result.flatten.map(&:to_i).sum

# p "#{final_result} views"

# require "open-uri"

url = "https://www.facebook.com/profile.php?id=100092575334824&sk=reels_tab" # the url of the web page you want to scrape
html = URI.open(url) # open the html of the page
doc = Nokogiri::HTML.parse(html) # create a nokogiri doc based on that html

parse1 = doc.css("div.x9f619 x193iq5w x1talbiv x1sltb1f x3fxtfs x1swvt13 x1pi30zi xw7yly9 xrljuej")

p parse1
