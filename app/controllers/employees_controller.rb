class EmployeesController < ApplicationController

  def index
    @departments = Department.all
    gon.departments = ActiveModel::Serializer::ArraySerializer.new(@departments, each_serializer: DepartmentSerializer).as_json

    respond_to do |format|
      format.html
    end
  end
end
