'use strict'

employeeMgmtApp = angular.module('EmployeeMgmt', ['ngResource'])

employeeMgmtApp.factory("Employee", ['$resouce', () ->
  $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
])

employeeMgmtApp.controller('EmployeeController', ['$scope', ($scope)->

  $scope.init = (employees)->
    $scope.employees = employees

  $scope.createEmployee = ()->
    employee = Employee.save($scope.newEmployee)
    $scope.employees.push(employee)
    $scope.newEmployee = {}

])
