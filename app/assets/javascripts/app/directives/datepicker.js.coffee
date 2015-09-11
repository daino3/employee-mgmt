'use strict'

@directives.directive('datepicker', ->
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
