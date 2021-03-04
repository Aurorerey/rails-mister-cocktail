class ApplicationController < ActionController::Base

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

end
