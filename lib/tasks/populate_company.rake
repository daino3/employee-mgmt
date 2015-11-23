namespace :populate do
  task :company => :environment do
    # company
    company = Company.where(name: 'Figuro').first_or_create!

    # departments
    finance_dep = Department.where(name: 'Finance', company: company).first_or_create!
    market_dep  = Department.where(name: 'Marketing', company: company).first_or_create!
    sales_dep   = Department.where(name: 'Sales', company: company).first_or_create!
    hr_dep      = Department.where(name: 'HR', company: company).first_or_create!
    it_dep      = Department.where(name: 'IT', company: company).first_or_create!
    exec_dep    = Department.where(name: 'Executive', company: company).first_or_create!

    # sub departments
    ['Accounting', 'Business Development', 'Tax'].each do |sub_dep|
      finance_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    ['Social Media', 'Advertising'].each do |sub_dep|
      market_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    ['Lead Generation', 'Inside Sales', 'Outside Sales'].each do |sub_dep|
      sales_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    ['Recruitment', 'Compliance'].each do |sub_dep|
      hr_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    ['Software Development', 'Product Development', 'Systems Administration'].each do |sub_dep|
      it_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    ['CEO', 'CFO', 'CTO'].each do |sub_dep|
      it_dep.sub_departments << SubDepartment.where(name: sub_dep).first_or_create!
    end

    # Employee Types
    %w(FullTime IndependentContractor).each do |emp_type|
      EmployeeType.where(name: emp_type, type: emp_type).first_or_create!
    end

    # Employees
    emps = {
      dain:  {first_name: 'Dain', last_name: 'Hall', hire_date: Time.zone.today - 18.months},
      steve: {first_name: 'Steve', last_name: 'Gray', hire_date: Time.zone.today - 12.months},
      joe:   {first_name: 'Joe', last_name: 'Schmidt', hire_date: Time.zone.today - 8.months},
      anne:  {first_name: 'Anne', last_name: 'Stephens', hire_date: Time.zone.today - 7.months},
      belle: {first_name: 'Belle', last_name: 'Romanowski', hire_date: Time.zone.today - 5.months},
      mike:  {first_name: 'Mike', last_name: 'Busch', hire_date: Time.zone.today - 10.months},
      rich:  {first_name: 'Richard', last_name: 'Johnson', hire_date: Time.zone.today - 15.months},
      chris: {first_name: 'Chris', last_name: 'Sell', hire_date: Time.zone.today - 13.months},
      sarah: {first_name: 'Sarah', last_name: 'Pritchard', hire_date: Time.zone.today - 6.months},
      craig: {first_name: 'Craig', last_name: 'Owens', hire_date: Time.zone.today - 9.months}
    }

    emps.each do |name, attrs|
      Employee.find_or_initialize_by(first_name: attrs[:first_name], last_name: attrs[:last_name]) do |emp|
        emp.hire_date = attrs[:hire_date]
        emp.save!
      end
    end

    # Employee Positions
    positions = {
      'CEO' => Department.find_by(name: 'Executive'),
      'CTO' => Department.find_by(name: 'IT'),
      'CMO' => Department.find_by(name: 'Marketing'),
      'CFO' => Department.find_by(name: 'Finance'),
      'Software Developer' => SubDepartment.find_by(name: 'Software Development'),
      'Business Analyst'   => SubDepartment.find_by(name: 'Business Development'),
      'Marketing Analyst'  => SubDepartment.find_by(name: 'Inside Sales')
    }

    positions.each do |title, department|
      EmployeePosition.find_or_initialize_by(title: title) do |pos|
        if department.is_a?(Department)
          pos.department = department
        elsif department.is_a?(SubDepartment)
          pos.sub_department = department
          case title
          when 'Software Developer' then pos.boss = EmployeePosition.find_by(title: 'CTO')
          when 'Business Analyst' then pos.boss   = EmployeePosition.find_by(title: 'CFO')
          when 'Marketing Analyst' then pos.boss  = EmployeePosition.find_by(title: 'CMO')
          end
        end
        pos.save!
      end
    end

    # Assign Executive Roles through PayStructure
    exec_pay_structures = {
      'CEO' => {type: EmployeeType.find_by(type: 'FullTime'),
                employee: Employee.find_by(first_name: 'Dain', last_name: 'Hall'),
                position: EmployeePosition.find_by(title: 'CEO'),
                start_date: lambda { exec_pay_structures['CEO'][:employee].hire_date },
                salary: 90_000
      },
      'CTO' => {type: EmployeeType.find_by(type: 'FullTime'),
                employee: Employee.find_by(first_name: 'Steve', last_name: 'Gray'),
                position: EmployeePosition.find_by(title: 'CTO'),
                start_date: lambda { exec_pay_structures['CTO'][:employee].hire_date },
                salary: 80_000
      },
      'CMO' => {type: EmployeeType.find_by(type: 'FullTime'),
                employee: Employee.find_by(first_name: 'Joe', last_name: 'Schmidt'),
                position: EmployeePosition.find_by(title: 'CMO'),
                start_date: lambda { exec_pay_structures['CMO'][:employee].hire_date },
                salary: 80_000
      },
      'CFO' => {type: EmployeeType.find_by(type: 'FullTime'),
                employee: Employee.find_by(first_name: 'Anne', last_name: 'Stephens'),
                position: EmployeePosition.find_by(title: 'CFO'),
                start_date: lambda { exec_pay_structures['CFO'][:employee].hire_date },
                salary: 80_000
      }
    }

    exec_pay_structures.each do |title, attrs|
      PayStructure.find_or_initialize_by(employee: attrs[:employee]) do |struct|
        struct.employee_type = attrs[:type]
        struct.employee_position = attrs[:position]
        struct.salary = attrs[:salary]
        struct.start_date = attrs[:start_date].call

        struct.save!
      end
      attrs[:position].department.update_attributes!(department_head: attrs[:position])
    end

    # Assign Employee Roles through PayStructure
    emp_pay_structures = {
      'Software Developer' => [{
          type: EmployeeType.find_by(type: 'FullTime'),
          employee: Employee.find_by(first_name: 'Mike', last_name: 'Busch'),
          position: EmployeePosition.find_by(title: 'Software Developer'),
          start_date: lambda { emp_pay_structures['Software Developer'][0][:employee].hire_date },
          salary: 90_000
        }, {
          type: EmployeeType.find_by(type: 'IndependentContractor'),
          employee: Employee.find_by(first_name: 'Belle', last_name: 'Romanowski'),
          position: EmployeePosition.find_by(title: 'Software Developer'),
          start_date: lambda { emp_pay_structures['Software Developer'][1][:employee].hire_date },
          hourly_rate: 50
        }, {
          type: EmployeeType.find_by(type: 'IndependentContractor'),
          employee: Employee.find_by(first_name: 'Richard', last_name: 'Johnson'),
          position: EmployeePosition.find_by(title: 'Software Developer'),
          start_date: lambda { emp_pay_structures['Software Developer'][2][:employee].hire_date },
          hourly_rate: 40
      }],
      'Marketing Analyst' => [{
          type: EmployeeType.find_by(type: 'FullTime'),
          employee: Employee.find_by(first_name: 'Chris', last_name: 'Sell'),
          position: EmployeePosition.find_by(title: 'Marketing Analyst'),
          start_date: lambda { emp_pay_structures['Marketing Analyst'][0][:employee].hire_date },
          salary: 70_000
        }, {
          type: EmployeeType.find_by(type: 'IndependentContractor'),
          employee: Employee.find_by(first_name: 'Sarah', last_name: 'Pritchard'),
          position: EmployeePosition.find_by(title: 'Marketing Analyst'),
          start_date: lambda { emp_pay_structures['Marketing Analyst'][1][:employee].hire_date },
          hourly_rate: 25
      }],
      'Business Analyst' => [{
        type: EmployeeType.find_by(type: 'FullTime'),
        employee: Employee.find_by(first_name: 'Craig', last_name: 'Owens'),
        position: EmployeePosition.find_by(title: 'Business Analyst'),
        start_date: lambda { emp_pay_structures['Business Analyst'][0][:employee].hire_date },
        salary: 70_000
      }]
    }

    emp_pay_structures.each do |dep_title, employees|
      employees.each do |attrs|
        PayStructure.find_or_initialize_by(employee: attrs[:employee]) do |struct|
          struct.employee_type = attrs[:type]
          struct.employee_position = attrs[:position]
          struct.salary = attrs[:salary] if attrs[:salary]
          struct.hourly_rate = attrs[:hourly_rate] if attrs[:hourly_rate]
          struct.start_date = attrs[:start_date].call

          struct.save!
        end

      end
    end
  end
end
