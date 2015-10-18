namespace :populate do
  task :company => :environment do
    # departments
    finance_dep = Department.where(name: 'Finance').first_or_create!
    market_dep  = Department.where(name: 'Marketing').first_or_create!
    sales_dep   = Department.where(name: 'Sales').first_or_create!
    hr_dep      = Department.where(name: 'HR').first_or_create!
    it_dep      = Department.where(name: 'IT').first_or_create!
    exec_dep    = Department.where(name: 'Executive').first_or_create!

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

    # Employee Position
    marketin_positions =
    EmployeePosition






  end
end
