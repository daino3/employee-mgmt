'use strict'

@services.factory("Employee", ['$resource', ($resource) ->

  Employee = (jsonObj) ->
    _.extend(@, jsonObj)

  Employee.prototype =
    sayHello: ->
      console.log('hello')

  httpMethods = $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
  _.extend(Employee, httpMethods)

  return Employee
])
