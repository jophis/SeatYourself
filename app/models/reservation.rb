class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

	validate :availability

	private
	def availability
		if !restaurant.availability(party_size, party_time)
		errors.add(:base, "restaurant is full, go away pls")
		end
	end
end
