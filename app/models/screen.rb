class Screen < ActiveRecord::Base
  belongs_to :computer

  accepts_nested_attributes_for :computer, allow_destroy: true

  def self.permited_params
    [:computer_id, :marca, :modelo, :serial, :bien_nacional, :pulgadas, :estatus]
  end

  def set_computer
    self.computer.blank? ? 0 : self.computer    
  end

end
