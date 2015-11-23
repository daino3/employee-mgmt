class Company < ActiveRecord::Base
  has_many :departments

  validates :name, uniqueness: true, presence: true
end
