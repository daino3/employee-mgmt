require 'rails_helper'

describe SpacingHelper do
  describe '#num_cols' do
    it 'returns the floor of the result of 16 cols divided by the input' do
      expect(num_cols(5)).to eq(3)
    end

    it 'returns 0 if the handed zero' do
      expect(num_cols(0)).to eq(0)
    end
  end
end
