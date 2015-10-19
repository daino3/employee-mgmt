require 'rails_helper'

describe Department do

  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company_id) }
end
