module BooksHelper

  def recent_movie_label(movie)
    movie.recent? ? 'Yes' : 'No'
  end
end
