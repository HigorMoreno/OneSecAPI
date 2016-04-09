class WorkDay < ActiveRecord::Base
	belongs_to :Employee
	attr_accessor :schedule

	def WorkDay.getSchedule (employee_id,day,interval)
		puts(employee_id)
		workday = WorkDay.where(:employee_id => employee_id, :day => day).first
		schedule = []
		WorkDay.computeSchedule(workday.start_morning_time, workday.end_morning_time, 60,schedule)
		WorkDay.computeSchedule(workday.start_afternoon_time, workday.end_afternoon_time, 60, schedule)
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
