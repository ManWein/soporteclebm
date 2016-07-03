class Computer < ActiveRecord::Base
  has_one :keyboard
  has_one :screen
  has_one :mouse
  has_one :regulator

  accepts_nested_attributes_for :keyboard
  accepts_nested_attributes_for :screen
  accepts_nested_attributes_for :mouse
  accepts_nested_attributes_for :regulator

end
