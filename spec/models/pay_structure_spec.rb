require 'rails_helper'

describe PayStructure do
  let(:subject) { FactoryGirl.build(:pay_structure, :full_time) }

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:employee_position_id) }
  it { should validate_presence_of(:employee_type_id) }
  it { should validate_presence_of(:salary) }

  context 'when part-time position' do
    let(:subject) { FactoryGirl.build(:pay_structure, :part_time) }
    it { should validate_presence_of(:hourly_rate) }
  end

end
