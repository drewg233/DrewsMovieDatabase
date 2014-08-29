class Movie < ActiveRecord::Base
	def self.addNewMovie(title, hours, minutes, rating, release, image_url, format, trailer)
		theMovie = Movie.new(title: title, hours: hours, minutes: minutes, format: format, release: release, rating: rating, image_url: image_url, trailer: trailer)
		theMovie.save
	end
end
