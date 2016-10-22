class Printer < ActiveRecord::Base
  belongs_to :office

  # accepts_nested_attributes_for :computer, allow_destroy: true

  def self.permited_params
    [:marca, :modelo, :serial, :bien_nacional, :estatus]
  end

end