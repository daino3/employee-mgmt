require 'rails_helper'

describe Employee do
  let(:marketing) {FactoryGirl.create(:department, name: 'Marketing')}
  let(:social_media_department) {FactoryGirl.create(:sub_department, department: marketing, name: 'Social Media')}
  let(:boss) {FactoryGirl.create(:employee)}
  let(:boss_position) {FactoryGirl.create(:employee_position, sub_department: social_media_department, employee: boss, title: 'Head of Social Media', start_date: Time.zone.today - 2.years)}
  let(:analyst) {FactoryGirl.create(:employee)}
  let(:analyst_position) {FactoryGirl.create(:employee_position, sub_department: social_media_department, boss: boss, employee: analyst, title: 'Social Media Analyst', start_date: Time.zone.today)}
  let(:employee_type) { FactoryGirl.create(:employee_type, type: 'W-2') }
  let(:analyst_pay) { FactoryGirl.create(:pay_structure, employee_position: analyst_position, employee_type: employee_type, start_date: Time.zone.today) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:hire_date) }

  describe '#current_position' do
    it 'returns the employees current position' do
      [analyst_position]
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
