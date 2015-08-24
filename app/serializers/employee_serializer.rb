class EmployeeSerializer < ActiveModel::Serializer
  attributes :first_name,
    :id,
    :last_name,
    :hire_date,
    :termination_date
end
