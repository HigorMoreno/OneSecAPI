class WorkDay < ActiveRecord::Base
	belongs_to :Employee

	def getSchedule
		schedule = []
		WorkDay.computeSchedule(self.start_morning_time, self.end_morning_time, self.interval,schedule)
		WorkDay.computeSchedule(self.start_afternoon_time, self.end_afternoon_time, self.interval, schedule)
		schedule
		
	end

	def WorkDay.computeSchedule(start_time,end_time,interval,schedule)
		current_time = start_time
		last_time = start_time + (interval * 60)
		while last_time <= end_time
			schedule << Schedule.new(current_time,last_time)
			current_time = last_time
			last_time = current_time + (interval * 60)
		end
	end
end
