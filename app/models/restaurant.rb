class Restaurant < ActiveRecord::Base
	has_many :reservations
	belongs_to :user

	# belongs_to :owner, Class "User" foreign_key: "owner_id" aliasessss
	 # has_many :patrons, through :reservations, class 'User'

	def availablity(party_size, party_time)
		# reservations.sum(:party_size) + party_size <= capacity
		reserve_size = reservations.where(party_time: party_time).sum(:party_size)
		reserve_size + party_size <= capacity
	end

	def opening_hour
		11
	end

	def closing_hour
		20
	end

	def time_slots
		reservation_interval = 1.hour 
		start_time = Time.zone.now + 10.minutes
		start_time = Time.zone.at(
			(start_time.to_f / reservation_interval).ceil * reservation_interval
				)
		start_time = [start_time, start_time.change(hour: opening_hour)].max

		end_time = (start_time + 3.days).change(hour: closing_hour) 

		all_times= []
		a_time = start_time
		
		begin
			all_times <<a_time
			a_time += reservation_interval

			if (a_time + reservation_interval ) > a_time.change(hour: closing_hour)
				a_time = (a_time + 1.day).change(hour:opening_hour)
			end
		
		end while a_time < end_time
		
		all_times
	end

	# this will return an array of 2-element arrays
	# [ [ time, time ], [ time, time ], .... ]
	def options_for_time_slots
		new_array = []
		time_slots.each do |x|
			new_array << [x,x]
		end

		new_array
	end

end
