class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location
  has_many :Employees
end
