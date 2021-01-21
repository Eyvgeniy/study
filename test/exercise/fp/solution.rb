module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        result = array.filter { |film| film['country'] && film['country'].split(',').length > 1 }
                      .map { |film| film['rating_kinopoisk'] }
                      .filter { |rating| rating.to_i.positive? }
                      .each_with_object({ rating: 0.0, count: 0 }) do |film, acc|
                        acc[:rating] += film.to_f
                        acc[:count] += 1
                      end
        result[:rating] / result[:count]
      end

      def chars_count(films, threshold)
        films.filter { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) do |acc, name|
               name.each_char { |char| acc += 1 if char == 'и' }
               acc
             end
      end
    end
  end
end
