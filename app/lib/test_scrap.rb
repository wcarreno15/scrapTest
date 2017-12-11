module Scrap
  class ScrapTest

    def initScrap
      puts 'hola'
      a = Mechanize.new
      page = a.get('https://www.zmart.cl/Scripts/default.asp')

      page.links.each do |link|
        puts link.text
      end
    end
  end
end
