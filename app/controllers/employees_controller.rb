class EmployeesController < ApplicationController

  def index
    @employees = Employee.all

    respond_to do |format|
      format.html
    end
  end
end
