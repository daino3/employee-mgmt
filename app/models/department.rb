class Department < ActiveRecord::Base
  has_many :sub_departments

  validates_uniqueness_of :name

  class << self
  end

end
