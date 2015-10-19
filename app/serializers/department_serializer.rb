class DepartmentSerializer < ActiveModel::Serializer
  attributes :name, :employees

  has_one :company
  has_many :sub_departments, serializer: SubDepartmentSerializer
end
