'use strict'

@controllers.controller('EmployeeController', ['$scope', 'Employee', ($scope, Employee)->
  $scope.errors = null
  $scope.newEmployee = null
  $scope.date = null

  $scope.init = ()->
    $scope.employees =  _.map(gon.employees, (empJson)-> new Employee(empJson))

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

