class CompanySerializer < ActiveModel::Serializer
  attributes :name

  has_many :departments, serializer: DepartmentSerializer
end
