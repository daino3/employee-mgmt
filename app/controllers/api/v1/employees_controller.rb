
class Api::V1::EmployeesController < Api::V1::BaseController
  respond_to :json

  def create
    respond_with(Employee.create(employee_params))
  end

  private

  def employee_params
    params.require(:employee).permit!
  end
end
