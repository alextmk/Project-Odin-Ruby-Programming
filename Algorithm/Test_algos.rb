require_relative 'algos.rb'
require 'test/unit'

class Test_algos < Test::Unit::TestCase
	
	def test_merge_sort
		@algo=Algos.new
		puts ""
		puts "Testing Merge Sort"
		assert_equal([1,2,3,4],@algo.merge_sort([4,3,2,1]))
		assert_equal([0],@algo.merge_sort([0]))
		assert_equal([-5,-4,-3,-2,0,5,6],@algo.merge_sort([6,0,-3,-4,-5,5,-2]))
		assert_equal([],@algo.merge_sort([]))
	end


	def test_binary_search
		@algo=Algos.new
		puts ""
		puts "Testing Binary Search"
		assert_equal(4,@algo.binary_search([1,2,3,4,5,6],5))
		assert_equal(0,@algo.binary_search([1],1))
		assert_equal(0,@algo.binary_search([-11,2,3,4,5,6],-11))
	end


	
end