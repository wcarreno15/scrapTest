namespace :scrapperTest do
  desc 'Test Scrap'
  task :testScrap => :environment do
    require 'mechanize'
    agent = Mechanize.new

    page = agent.get("https://www.zmart.cl/Scripts/prodSearch.asp?strSearch=top")

    page.links.each do |link|
      puts link.text
    end
  end
end
