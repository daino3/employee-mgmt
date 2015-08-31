require 'rails_helper'

describe Department do

  it { should validate_uniqueness_of(:name) }
end
