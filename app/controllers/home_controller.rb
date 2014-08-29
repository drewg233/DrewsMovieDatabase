class HomeController < ApplicationController
	skip_before_filter :verify_authenticity_token  
  def index
    @movies = Movie.all
    if (params[:order] == 'date')
      # binding.pry
      @movies = @movies.sort_by{|e| e[:release]}
    end
    if (params[:order] == 'title')
      # binding.pry
      @movies = @movies.sort_by{|e| e[:title]}
    end
    if (params[:order] == 'rating')
      # binding.pry
      @movies = @movies.sort_by{|e| e[:rating]}.reverse
    end
  end
  def create
  	Movie.addNewMovie(params[:title], params[:hours], params[:minutes], params[:rating], params[:release], params[:image_url], params[:format], params[:trailer])

    redirect_to :action=>"index", :controller=>"home", :flash => { :error => params[:trailer] }
  end
  def destroy
    theMovie = Movie.where(id: params[:id].to_i)[0]
    theMovie.delete
    redirect_to :action=>"index", :controller=>"home"
  end
  def update
    movie = Movie.where(id: params[:id].to_i)[0]
    movie.title = params[:title]
    movie.hours = params[:hours]
    movie.minutes = params[:minutes]
    movie.rating = params[:rating]
    movie.release = params[:release]
    movie.image_url = params[:image_url]
    movie.format = params[:format]
    movie.trailer = params[:trailer]
    movie.save

  	redirect_to :action=>"index", :controller=>"home"
  end
  def new
  end
  def show
    @movie = Movie.where(id: params[:id].to_i)[0]
  end
  def delete
  end
end
