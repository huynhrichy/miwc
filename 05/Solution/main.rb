require 'csv'
require_relative 'headline_scraper'


the_scraper = HeadlineScraper.new("http://www.reddit.com/r/ruby/")

CSV.open("my_results.csv", "wb") do |csv|
    the_scraper.get_headlines.each do |link|
        csv << [link.content, link["href"]]
    end
end
