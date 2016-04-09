class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name,  :company_id, :schedule
  has_many :WorkDays
end
