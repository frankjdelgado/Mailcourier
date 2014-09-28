require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "save invalid user" do

		user = User.new
		assert_not user.valid?, "Saved the user withour data"

		user = User.new(
				:email => 'a1@a.com',
				:username =>'jon',
				:role => 0,
				:agency_id => 1,
				:encrypted_password => '<%= Devise.bcrypt(User, "12345678")%>'
			)
		assert_not user.valid?, "Saved with duplicated username"

		user = User.new(
				:email => 'a2@a.com',
				:role => 0,
				:agency_id => 1,
				:encrypted_password => '<%= Devise.bcrypt(User, "12345678")%>'
			)
		assert_not user.valid?, "Saved without username"

		user = User.new(
				:email => 'a3@a.com',
				:username =>'jon',
				:role => 3,
				:agency_id => 1,
				:encrypted_password => '<%= Devise.bcrypt(User, "12345678")%>'
			)
		assert_not user.valid?, "Saved with wrong role"

		user = User.new(
				:email => 'a4@a.com',
				:username =>'jon',
				:role => 0,
				:agency_id => 1,
				:encrypted_password => '<%= Devise.bcrypt(User, "12345678")%>'
			)
		assert_not user.valid?, "Saved with wrong password"

	end
	
end
