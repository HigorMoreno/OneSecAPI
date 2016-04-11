class WorkDaySerializer < ActiveModel::Serializer
  attributes :id, :day, :schedule

  def schedule
  	object.getSchedule
  end
end
