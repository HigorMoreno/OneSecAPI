class Employee < ActiveRecord::Base
	belongs_to :Company
	has_many :WorkDays
end
