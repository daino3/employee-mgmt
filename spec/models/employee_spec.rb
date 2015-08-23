require 'rails_helper'

describe Employee do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:hire_date) }
end
