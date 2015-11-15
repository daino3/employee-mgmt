'use strict'

@services.factory("Department", ['$resource', ($resource) ->

  class Department
    constructor: (jsonObj)->
      _.extend(@, jsonObj)

  httpMethods = $resource('/departments/:symbol', {symbol: "@symbol"},
    {
      updateState: {url: '/departments/:symbol', method: 'PUT', isArray: false, params: {action: 'action'}},
      update: {method: "PUT", isArray: false}
    }
  )

  _.extend(Department, httpMethods)

  return Department
])
