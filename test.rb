require 'mechanize'

puts 'hola'
agent = Mechanize.new

i = 1
data = {
  'id' => '321',
  'idRow' => '2997',
  'curPage' => i,
  'filter' => nil,
  'order' => '0',
  'filter2' => nil
}

games = []

while !agent.post('https://www.zmart.cl/scripts/proddisplay_page.asp', data).links.empty? do
  ps4 = agent.post('https://www.zmart.cl/scripts/proddisplay_page.asp', data)

  puts "\nPag: #{i}\n"

  games += ps4.search('//div[@class="BoxProductoS2 BorderPlatPS4"]').map do |x|
    {
    name: x.at('.//div[@class="BoxProductoS2_Descripcion"]').text,
    url: x.at('.//div[@class="BoxProductoS2_Descripcion"]//a/@href').value,
    price: x.at('.//div[@class="BoxProductoS2_Precios"]//span[@class="BoxProductoS2_Precio"]').text
    }
  end

  i += 1
  data['curPage'] = i
end

puts games
