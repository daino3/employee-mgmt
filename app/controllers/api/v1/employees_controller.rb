
class Api::V1::EmployeesController < Api::V1::BaseController
  respond_to :json

  def create
    respond_with(Employee.create(employee_params))
  end

  def index
    @employees =
      if params[:department_id]
        department = Department.find(params[:department_id])
        department.employees
      else
        Employee.all
      end
    employee_serializer = ActiveModel::Serializer::ArraySerializer.new(@employees, each_serializer: EmployeeSerializer)
    respond_with(employee_serializer)
  end

  private

  def employee_params
    params.require(:employee).permit!
  end
end
