require 'rails_helper'

describe Employee do
  let(:marketing) {FactoryGirl.create(:department, name: 'Marketing')}
  let(:social_media_department) {FactoryGirl.create(:sub_department, department: marketing, name: 'Social Media')}

  let(:boss)    { FactoryGirl.create(:employee) }
  let(:analyst) { FactoryGirl.create(:employee) }
  let(:boss_position)    { FactoryGirl.create(:employee_position, sub_department: social_media_department, title: 'Head of Social Media') }
  let(:analyst_position) { FactoryGirl.create(:employee_position, sub_department: social_media_department, title: 'Social Media Analyst', boss: boss_position) }
  let(:boss_pay)    { FactoryGirl.create(:pay_structure, :full_time, employee_position: boss_position, employee: boss, start_date: Time.zone.today - 10.months, ) }
  let(:analyst_pay) { FactoryGirl.create(:pay_structure, :part_time, employee_position: analyst_position, employee: analyst, start_date: Time.zone.today) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:hire_date) }

  describe '#current_position' do
    it 'returns the employees current position' do
      [analyst_pay]
      expect(analyst.current_position.title).to eq('Social Media Analyst')
    end
  end

  describe '#pay_structure' do
    xit 'returns the employees current pay structure' do
      [analyst_pay]
      # TODO: define pay structure with salary / wage fields
      expect(analyst.pay_structure).to be_present
    end
  end

  describe '#employee_type' do
    xit 'returns the employees current employee type' do
      [analyst_pay]
      # TODO: Fix 1099 and W-2 employee type issues
      expect(analyst.employee_type).to be_present
    end
  end
end
