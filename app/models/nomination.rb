class Nomination < ActiveRecord::Base
	attr_accessor :name

	has_many :nominees
	has_many :nominators

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	
end