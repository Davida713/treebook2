require 'test_helper'

class UserTest < ActiveSupport::TestCase
 	test "a user should enter first name" do 
 		user = User.new
 		assert !user.save
 		assert !user.errors[:first_name].empty?
 		
 	end

 	test "a user should enter last name" do 
 		user = User.new
 		assert !user.save
 		assert !user.errors[:last_name].empty?
 		
 	end

 	test "a user should enter profile name" do 
 		user = User.new
 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 		
 	end

 	test "a user should have a unique profile name" do 
 		user = User.new
 		user.profile_name = users(:David).profile_name
 		

 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 		
 	end

 	test "a user should have a profile name without spaces" do 
	 	user = User.new(first_name: 'David', last_name: 'Allan', email: 'Davida713@gmail.com')
		user.password = user.password_confirmation = 'asdfgdfd'

		
	 	user.profile_name = "My Profile with spaces"

	 	assert !user.save
	 	assert !user.errors[:profile_name].empty?
	 	assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'David', last_name: 'Allan', email: 'Davida713@gmail.com')
		user.password = user.password_confirmation = 'asdfgdfd'


		user.profile_name = 'Davida714'
		assert user.valid?

	end

end
