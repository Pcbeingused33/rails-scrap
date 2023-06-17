require 'csv'
# require 'content_creator'
# require 'content_creators_controller'
# require_relative 'content_creator'

filepath = "url_string.csv"

# csv = CSV.open(filepath, headers: true)
# strings = CSV.parse(filepath)

CSV.open(filepath, quote_char: "\x00", col_sep: "\t").each do |s|
  p s
end

@content_creators.each do |string|
  CSV << [string.name, string.instagram, string.tiktok, string_facebook, string_youtube].flatten
end

# pasan horizontalmente
# @content_creator.each do |string|
#   CSV << [string.name, string.instagram, string.tiktok, string_facebook, string_youtube].flatten
# end

# CSV << @content_creators (all instances)
# dame el string de ig que tenga el mismo nombre
# CSV => python script

# strings.each do |string|
#   Rails.logger.debug "======#{string}"
# end

# CSV.foreach(filepath) do |row|
#   p row
# end

# CSV.new(File.open(filepath, 'r:bom|utf-8'), col_sep: ';').each do |row|
#   p row
# end

# CSV.foreach(filepath, headers: :first_row) do |row|
#   p row
# end

# CSV.generate do |csv|
#   @content_creators.each do |x|
#     csv << x
#   end
# end

# instancia.name => encuentra row donde haya url con name

# csv #first_row: name #second_row: url
  # dame la row dónde tenga el nombre x

# <%# csv.query(instance.name) => python_script %>
# csv
# <%# csv.foreach(filepath) do |row| %>
# <%#     %>
# <%# python_script => csv  %>
# <%# csv[instance.id] => view %>
