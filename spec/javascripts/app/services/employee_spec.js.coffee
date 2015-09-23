beforeEach module('EmployeeMgmt.services')
beforeEach ->
  mock = alert: jasmine.createSpy()
  debugger
  module ($provide) ->
    $provide.value '$window', mock
    return
  inject ($injector) ->
    notify = $injector.get('Employee')
    return
  return
it 'should not alert first two notifications', ->
  notify 'one'
  notify 'two'
  expect(mock.alert).not.toHaveBeenCalled()
  return
it 'should alert all after third notification', ->
  notify 'one'
  notify 'two'
  notify 'three'
  expect(mock.alert).toHaveBeenCalledWith 'one\ntwo\nthree'
  return
it 'should clear messages after alert', ->
  notify 'one'
  notify 'two'
  notify 'third'
  notify 'more'
  notify 'two'
  notify 'third'
  expect(mock.alert.callCount).toEqual 2
  expect(mock.alert.mostRecentCall.args).toEqual [ 'more\ntwo\nthird' ]
  return
