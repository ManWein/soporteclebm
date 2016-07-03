class Mouse < ActiveRecord::Base
  belongs_to :computer

  accepts_nested_attributes_for :computer, allow_destroy: true

end
