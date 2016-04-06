class Company < ActiveRecord::Base

	def compute_schedules(start_time,end_time,interval)
		schedule_list = []
		current_time = start_time
		last_time = start_time + (interval * 60)
		while last_time < end_time
			schedule_list << Schedule.new(current_time,last_time)
			current_time = last_time
			last_time = current_time + (interval * 60)
		end
		schedule_list
	end
end
