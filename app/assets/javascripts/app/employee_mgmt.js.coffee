'use strict'

window.employeeMgmtApp = angular.module('EmployeeMgmt', ['EmployeeMgmt.controllers'])

services = angular.module('EmployeeMgmt.services', ['ngResource'])
controllers = angular.module('EmployeeMgmt.controllers', ['EmployeeMgmt.services'])

services.factory("Employee", ['$resource', ($resource) ->
  $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
])

controllers.controller('EmployeeController', ['$scope', 'Employee', ($scope, Employee)->

  $scope.init = ()->
    $scope.employees = gon.employees

  $scope.createEmployee = ()->
    employee = Employee.save($scope.newEmployee)
    debugger
    $scope.employees.push(employee)
    $scope.newEmployee = {}
])
