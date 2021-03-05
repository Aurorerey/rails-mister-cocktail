class DosesController < ApplicationController
  # def new
  #  @cocktail = Cocktail.find(params[:cocktail_id])
  #  @dose = Dose.new
  #end

  def create
    # we need `restaurant_id` to associate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
      @review = Review.new
      render "cocktails/show"
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Doses was successfully destroyed.'
  end
  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
