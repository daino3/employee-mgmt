'use strict'

window.employeeMgmtApp = angular.module('EmployeeMgmt', ['EmployeeMgmt.controllers'])

services = angular.module('EmployeeMgmt.services', ['ngResource'])
controllers = angular.module('EmployeeMgmt.controllers', ['EmployeeMgmt.services'])

services.factory("Employee", ['$resource', ($resource) ->

  Employee = (jsonObj) ->
    _.extend(@, jsonObj)

  Employee.prototype =
    sayHello: ->
      console.log('hello')

  httpMethods = $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
  _.extend(Employee, httpMethods)

  return Employee
])

controllers.controller('EmployeeController', ['$scope', 'Employee', ($scope, Employee)->
  $scope.errors = null

  $scope.init = ()->
    $scope.employees =  _.map(gon.employees, (empJson)-> new Employee(empJson))

  $scope.createEmployee = ()->
    promise = Employee.save($scope.newEmployee).$promise
    promise.then((response) ->
      debugger
      $scope.employees.push(employee)
      $scope.newEmployee = {}
      return
    ).catch( (response) ->
      $scope.errors = response.data.errors
      debugger
      return
    )

])
