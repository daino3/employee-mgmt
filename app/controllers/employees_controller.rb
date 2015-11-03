class EmployeesController < ApplicationController

  def index
    gon.departments = ActiveModel::Serializer::ArraySerializer.new(Department.all, each_serializer: DepartmentSerializer).as_json
    gon.employees = ActiveModel::Serializer::ArraySerializer.new(Employee.all, each_serializer: EmployeeSerializer).as_json

    respond_to do |format|
      format.html
    end
  end
end
