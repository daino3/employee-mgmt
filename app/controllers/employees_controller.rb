class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    gon.employees = ActiveModel::Serializer::ArraySerializer.new(@employees, each_serializer: EmployeeSerializer).as_json

    respond_to do |format|
      format.html
    end
  end
end
