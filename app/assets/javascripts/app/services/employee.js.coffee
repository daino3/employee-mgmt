'use strict'

@services.factory("Employee", ['$resource', ($resource) ->

  class Employee
    constructor: (jsonObj) ->
      _.extend(@, jsonObj)

    @property 'salary',
      get: ()-> @current_pay.salary

    @property 'hourlyRate',
      get: ()-> if @current_pay.hourly_rate? then "$#{@current_pay.hourly_rate} / hour" else null


  httpMethods = $resource('/api/v1/employees/:id.json', {id: "@id"}, {update: {method: 'PUT'}})
  _.extend(Employee, httpMethods)

  return Employee
])
