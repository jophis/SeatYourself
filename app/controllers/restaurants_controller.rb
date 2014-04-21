class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservation = Reservation.new( :restaurant_id => @restaurant.id )

		@time_slots = @restaurant.options_for_time_slots
	end
	
	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_path
		else
			render "new"
		end
	end

	def update
	end

	def delete
	end

	private
  def restaurant_params
  	params.require(:restaurant).permit(:name, :address, :phone_number, :picture, :description, :capacity)
  end
end
