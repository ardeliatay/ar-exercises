require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, length: { in: 40..200 }
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
end

puts "Enter store name:"


@new_store = $stdin.gets.chomp

new_store = Store.new(name: @new_store)

new_store.save

new_store.errors.messages.each do |error|
  puts error
end
