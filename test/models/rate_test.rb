require 'test_helper'

class RateTest < ActiveSupport::TestCase

  	test "invalid rate" do

		rate = Rate.new
		assert_not rate.valid?, "Empty rate is valid"

		rate = Rate.new(
				:package => 'a1@a.com',
				:cost =>'jon',
				:status => 1,
			)
		assert_not rate.valid?, "rate with string package is valid"

		rate = Rate.new(
				:package => 'a1@a.com',
				:cost =>'jon',
				:status => 1,
			)
		assert_not rate.valid?, "rate with string cost is valid"

		rate = Rate.new(
				:package => 1,
				:cost => 2,
				:status => 3,
			)
		assert_not rate.valid?, "rate with status larger than 1 is valid"
	end

	test "valid rate" do
		rate = Rate.new(
				:package => 1,
				:cost => 2,
				:status => 0,
			)
		assert rate.valid?, "rate with with valid package,cost and status 0 is invalid"

		rate = Rate.new(
				:package => 1.0,
				:cost => 2.0,
				:status => 0,
			)
		assert rate.valid?, "rate with with valid package,cost and status 1 is invalid"
	end

end
