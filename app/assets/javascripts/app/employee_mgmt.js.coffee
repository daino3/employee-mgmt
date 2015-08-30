'use strict'

window.employeeMgmtApp = angular.module('EmployeeMgmt', ['EmployeeMgmt.controllers'])

services = angular.module('EmployeeMgmt.services', ['ngResource'])
directives = angular.module('EmployeeMgmt.directives', [])
controllers = angular.module('EmployeeMgmt.controllers', ['EmployeeMgmt.services', 'EmployeeMgmt.directives'])

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

directives.directive('datepicker', ->
  {
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attrs, ngModelCtrl) ->
      element.datepicker
        dateFormat: 'yy-mm-dd'
        onSelect: (date, obj) ->
          scope.date = date
          scope.$apply()
          return
      return
  }
)
