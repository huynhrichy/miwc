require_relative 'headline_scraper'
require 'csv' 

 
####

# Search for nodes by css

@the_scraper = HeadlineScraper.new('http://www.reddit.com/r/amiibocanada/new')

CSV.open("my_results.csv", "w") do |csv|
    @the_scraper.get_headlines.each do |heading|
        csv << [heading.content, heading["href"]]
    end
end 



####