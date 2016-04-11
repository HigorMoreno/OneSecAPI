class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name,  :company_id
  has_many :WorkDays
end
