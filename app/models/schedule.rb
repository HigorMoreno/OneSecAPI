class Schedule
	attr_accessor :start_time, :end_time

	def initialize(start_time,end_time)
		@start_time = start_time
		@end_time = end_time
	end
end
