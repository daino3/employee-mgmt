
module SpacingHelper
  def num_cols(num)
    return 0 if num == 0
    # 16 is the number of foundation columns in a row
    (16.0 / num).floor
  end
end
