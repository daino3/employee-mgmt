class SubDepartmentSerializer < ActiveModel::Serializer
  attributes :name

  has_one :departments, serializer: DepartmentSerializer
end
