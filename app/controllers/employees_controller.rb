class EmployeesController < ApplicationController

  def index
    gon.departments = @departments = Department.all
    gon.employees = ActiveModel::Serializer::ArraySerializer.new(Employee.all, each_serializer: EmployeeSerializer).as_json

    respond_to do |format|
      format.html
    end
  end
end
