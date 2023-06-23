# require File.expand_path('/home/ale/code/Pcbeingused33/rails-crud/scrapers', 'facebook_scraper.rb')
# require File.expand_path('/home/ale/code/Pcbeingused33/rails-crud/scrapers', 'instagram_scraper.rb')
# require File.expand_path('/home/ale/code/Pcbeingused33/rails-crud/scrapers', 'tiktok_scraper.rb')
# require File.expand_path('/home/ale/code/Pcbeingused33/rails-crud/scrapers', 'youtube_scraper.rb')
# require 'byebug'
# require 'rest-client'
# require 'rubygems'
# require 'faraday'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'csv'

class ContentCreatorsController < ApplicationController
  helper_method :run_scraper_facebook, :run_scraper_tiktok, :run_scraper_youtube, :import_string, :ig_parser, :read_csv, :add_content_creator
  include HTTParty
  # base_uri 'api.stackexchange.com'

  def index
    @python_script = `python scrapers/instagram_scraper.py`
    @content_creators = ContentCreator.all
    # array = []
    # CSV.foreach(ig_views) do |row|
    #   array << row
    # end
  end

  def show
    @content_creator = ContentCreator.find(params[:id])
  end

  def new
    @content_creator = ContentCreator.new
  end

  def add_content_creator
    @content_creator = ContentCreator.new
  end

  def create
    content_creator = ContentCreator.new(content_creator_params)
    content_creator.save
  end

  def import_string
    array = []
    @content_creators.map do |instance|
      array << instance.instagram
      array.uniq!
      array.each do |string|
        CSV << string
      end
    end
  end

  def ig_parser(argument)
    filepath = "url_strings.csv"

    CSV.open(filepath, "wb") do |csv| # replaces whole doc, leaves last string as result
      csv << argument
    end
  end

  # @content.creators.each
    # creator.instagram
    #

  # def read_csv(column)
  #   ig_views = 'ig_views.csv'
  #   iteration_num = ""

  #   CSV.open(ig_views, quote_char: "\x00", col_sep: "\t").each do |row|
  #     iteration_num = row[0].split(",").size
  #   end

  #   @hash = {}
  #   while column <= iteration_num
  #     CSV.open(ig_views, quote_char: "\x00", col_sep: "\t").each do |row|
  #       views_num = row[0].split(",")[column]
  #       # views_num.delete!(" ") unless views_num.nil?
  #       @hash[:column] = views_num[column]
  #     end
  #   end
  #   return hash
  # end

  def read_csv
    ig_views = 'ig_views.csv'

    CSV.open(ig_views, quote_char: "\x00", col_sep: "\t").each do |row|
      return row[0].split(",")
    end
  end

    # CSV.open(filepath, quote_char: "\x00", col_sep: "\t").each do |row|
    #   p row
    # end

    # CSV.open(filepath, "wb") do |csv|
    #   csv << ["aaa"]

    #   csv << ["bbb"]
    # end

    # CSV.foreach(filepath) do |row|
    #   p row
    # end


  # csv row[instance_id] => ig_scraper.py
  # ig_scraper.py => rails view

  # csv == sacar string en funcion del id de content_creator
  #

  def run_scraper_tiktok(creator)
    url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{creator}")

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
  end

  def run_scraper_facebook(creator)
    url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{creator}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'

    response = http.request(request)
    parsed_response = response.read_body

    views = parsed_response.scan(/"play_count(.*?)"total_posts/) # array
    # a = [["\\\">227"], ["\\\">219"], ["\\\">230"], ["\\\">231"], ["\\\">247"], ["\\\">279"], ["\\\">262"], ["\\\">838"]]
    result = views.map {|x| x.to_s.scan(/[0-9]+/)}
    final_result = result.flatten.map(&:to_i).sum

    p "#{final_result} views"
  end

  def run_scraper_instagram(creator)
    url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{creator}")

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

  end

  def run_scraper_youtube(creator)
    url = URI("https://api.scrapingrobot.com/?token=59ab7c1a-d14e-49d4-8dd3-4568e5a804a5&url=#{creator}")

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
  p "#{total} views"
  end

  private

  def content_creator_params
    params.require(:content_creator).permit(:name, :tiktok, :instagram, :facebook, :youtube)
  end
end
