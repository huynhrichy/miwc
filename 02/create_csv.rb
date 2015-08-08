require 'csv'

CSV.open("my_results.csv", "wb") do |csv|
  csv << ["1","2","3"]
  csv << ["a", "b","c"]
end