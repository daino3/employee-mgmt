class EmployeeSerializer < ActiveModel::Serializer
  attributes :first_name,
    :id,
    :last_name,
    :hire_date,
    :termination_date,
    :department,
    :sub_department,
    :current_position,
    :current_pay

end
