require 'spec_helper'

	describe Restaurant do
		it 'return true when restaurant is empty' do
			r = Restaurant.new(name: 'canoe', capacity: 100)
			expect(r.availability).to be_true
		
	end
	
end