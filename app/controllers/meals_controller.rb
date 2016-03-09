class MealsController < ApplicationController
	before_action :meal, only: [:sold, :unsold]

	def index
    respond_with Meal.all.includes(:order)
  end

  def sold
  	meal.update_attributes(active: false)
  	render json: {status: :ok}
  end

  def unsold
  	meal.update_attributes(active: true)
  	render json: {status: :ok}
  end

  private

  def meal
	  Meal.find(params[:id])
	end

end
