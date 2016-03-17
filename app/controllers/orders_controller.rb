class OrdersController < ApplicationController
	before_action :meal, only: :create
	before_action :order, only: [:destroy, :delivered]

	def index
		respond_with current_user.orders
	end

	def create
    order = meal.create_order(order_params.merge(user: current_user))
    respond_with order
  end

  def destroy
  	order.destroy
  	render json: {status: :ok}
  end

  def delivered
  	order.update_attributes(status: "delivered")
  	render json: {status: :ok}
  end

  private

	  def order_params
	    params.require(:order).permit(:status)
	  end

	  def meal
	  	Meal.find(params[:meal_id])
	  end

	  def order
	  	Order.find(params[:id])
	  end
end
