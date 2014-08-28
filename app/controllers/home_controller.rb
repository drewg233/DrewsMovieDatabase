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
  	Movie.addNewMovie(params[:title], params[:hours], params[:minutes], params[:rating], params[:release], params[:image_url], params[:format])
    redirect_to :action=>"index", :controller=>"home"
  end
  def destroy
    theMovie = Movie.where(id: params[:id].to_i)[0]
    theMovie.delete
  	redirect_to :action=>"index", :controller=>"home"
  end
  def update
  end
  def new
  end
  def show
  end
  def delete
  end
end
