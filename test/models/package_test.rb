require 'test_helper'

class PackageTest < ActiveSupport::TestCase

  	test "invalid package" do

		package = Package.new
		assert_not package.valid?, "Empty package is valid"

		package = Package.new(
			:description => 'longclaw',
			:weight => 10.1,
			:height => 120.1,
			:width => 1,
			:depth => 0.8,
			:value => 1,
			:sender_id => 2,
			:receiver_id => 1,
			:shipping_cost => 64.72,
		  )
		assert_not package.valid?, "packave without agency is valid"

		package = Package.new(
			:description => 'longclaw',
			:height => 120.1,
			:width => 1,
			:depth => 0.8,
			:agency_id => 1,
			:value => 1,
			:sender_id => 2,
			:receiver_id => 1,
			:shipping_cost => 64.72,
			:ref_number => 'mc-asdadasds',
		  )
		assert_not package.valid?, "packave without weight is valid"

		package = Package.new(
			:description => 'longclaw',
			:height => 120.1,
			:width => 1,
			:depth => 0.8,
			:sender_id => 2,
			:receiver_id => 1,
			:shipping_cost => 64.72,
			:agency_id => 1,
			:ref_number => 'mc-asdadasds',
		  )
		assert_not package.valid?, "packave without value is valid"

		package = Package.new(
			:description => 'longclaw',
			:height => 120.1,
			:width => 1,
			:depth => 0.8,
			:value => 1,
			:sender_id => 2,
			:receiver_id => 1,
			:agency_id => 1,
			:ref_number => 'mc-asdadasds'
		  )
		assert_not package.valid?, "packave without shipping_cost is valid"

		package = Package.new(
			:description => 'longclaw',
			:height => 120.1,
			:width => 1,
			:value => 1,
			:sender_id => 2,
			:receiver_id => 1,
			:agency_id => 1,
			:ref_number => 'mc-asdadasds',
			:shipping_cost => 64.72,
		  )
		assert_not package.valid?, "packave without depth is valid"
	end

	test "valid package" do

		package = Package.new(
			:description => 'longclaw',
			:weight => 10,
			:height => 120.1,
			:width => 1.0,
			:depth => 1,
			:value => 1,
			:sender_id => 2,
			:receiver_id => 1,
			:agency_id => 1,
			:shipping_cost => 64.72,
			:ref_number => 'mc-asdadasds'
		  )
		assert package.valid?, "valid package is invalid"
	end
end
