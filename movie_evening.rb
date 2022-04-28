require_relative 'lib/collection_parser'
require_relative 'lib/film'
require_relative 'lib/films_collection'

URL_WIKI = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'.freeze

collection = CollectionParser.read_from_wiki

puts "\nДобрый день, любители вечерних киносеансов!"
puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
puts

sleep(3)

producers = collection.show_producers
puts producers

print "\nВведите порядковый номер режиссёра от 1 до #{producers.size}: "
user_input = gets.to_i
puts

until user_input.between?(1, producers.size)
  print "Введите номер режиссёра от 1 до #{producers.size}: "
  user_input = gets.to_i
  puts
end

collection.user_input = user_input - 1

puts 'Сегодня вечером рекомендуем посмотреть:'

puts Film.new(collection.choice_producer)
