'use strict'

@employeeMgmtApp = angular.module('EmployeeMgmt', ['EmployeeMgmt.controllers', 'mm.foundation'])
@services = angular.module('EmployeeMgmt.services', ['ngResource'])
@directives = angular.module('EmployeeMgmt.directives', [])
@controllers = angular.module('EmployeeMgmt.controllers', ['EmployeeMgmt.services', 'EmployeeMgmt.directives'])

