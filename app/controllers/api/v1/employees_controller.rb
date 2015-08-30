
class Api::V1::EmployeesController < Api::V1::BaseController
  respond_to :json

  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee.to_json, status: 200
    else
      render json: { errors: employee.errors, message: 'Invalid Employee' }, status: 400
    end
  end

  private

  def employee_params
    params.require(:employee).permit!
  end
end
