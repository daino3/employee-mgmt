'use strict'

@controllers.controller('NewEmployeeController', ['$scope', 'Employee', 'Department', '$modalInstance', 'department', 'departments',
  ($scope, Employee, Department, $modalInstance, department, departments)->
    $scope.department = department
    $scope.departments = departments
    window.controller = $scope

    $scope.ok = ->
      $modalInstance.close()
    $scope.cancel = ->
      $modalInstance.dismiss()

])
