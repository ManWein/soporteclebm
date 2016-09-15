class Mouse < ActiveRecord::Base
  belongs_to :computer

  accepts_nested_attributes_for :computer, allow_destroy: true

  def self.permited_params
    [:marca, :modelo, :serial, :bien_nacional]
  end

end