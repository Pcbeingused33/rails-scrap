require 'csv'

# CSV.parse('1,chocolaet\n2,bacon\n3,apple')
ig_views = 'ig_views.csv'
iteration_num = ""

ig_views = 'ig_views.csv'

column = 0

CSV.open(ig_views, quote_char: "\x00", col_sep: "\t").each do |row|
  return row[0].split(",")
end
