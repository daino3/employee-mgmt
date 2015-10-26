'use strict'

@services.factory("Employee", ['$resource', ($resource) ->

  class Employee
    constructor: (jsonObj) ->
      _.extend(@, jsonObj)

  httpMethods = $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
  _.extend(Employee, httpMethods)

  return Employee
])
