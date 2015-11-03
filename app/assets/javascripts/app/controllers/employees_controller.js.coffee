'use strict'

@controllers.controller('EmployeesController', ['$scope', 'Employee', 'Department', '$modal',
  ($scope, Employee, Department, $modal)->
    $scope.errors = null
    $scope.newEmployee = null
    $scope.date = null

    $scope.init = ()->
      $scope.employees =  _.map(gon.employees, (empJson)-> new Employee(empJson))
      $scope.departments =  _.map(gon.departments, (depJson)-> new Department(depJson))
      window.controller = @

    $scope.filterByDepartment = (departmentName, event)->
      $('dd.active').removeClass('active')
      selectedFilter = angular.element(event.target).parent()
      selectedFilter.addClass('active')
      $scope.selectedDepartment = departmentName

    $scope.departmentFilter = (item)->
      if $scope.selectedDepartment?
        item.department.name == $scope.selectedDepartment
      else
        item

    $scope.newEmployee = ()->
      modalInstance = $modal.open(
        templateUrl: 'new_employee_modal.html'
        controller: 'NewEmployeeController'
        resolve:
          department: -> $scope.selectedDepartment
          departments: -> $scope.departments
        windowClass: 'tiny'
      )
      modalInstance.result.then ->
        $scope.createEmployee()


    $scope.createEmployee = ()->
      params = {employee: _.extend($scope.newEmployee, hire_date: $scope.date)}
      promise = Employee.save(params).$promise
      promise.then((response) ->
        $scope.employees.push(new Employee(response))
        $scope.date = $scope.newEmployee = {} # reset form / scope variables
        return
      ).catch( (response) ->
        $scope.errors = response.data.errors
        return
      )
])

