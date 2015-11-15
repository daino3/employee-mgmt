describe "Employee", ->
  Employee = null
  testEmployee = null

  beforeEach module('EmployeeMgmt.services')

  beforeEach(inject (_Employee_) ->
    Employee = _Employee_
    testEmployee = new Employee(JSON.parse(readFixtures('employee.json')))
  )

  describe '#salary', ->
    it 'returns the employees current position\'s salary', ->
      expect(testEmployee.salary).toEqual(90000)

  describe '#hourlyRate', ->
    it 'returns null if the employee is a full-time employee', ->
      expect(testEmployee.hourlyRate).toBe(null)

    it 'returns an hourly rate if the employee is a part-time employee', ->
      testEmployee.current_pay.hourly_rate = 10
      expect(testEmployee.hourlyRate).toBe("$10 / hour")
