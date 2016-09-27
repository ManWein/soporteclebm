class Screen < ActiveRecord::Base
  belongs_to :computer

  accepts_nested_attributes_for :computer, allow_destroy: true

  def self.permited_params
    [:marca, :modelo, :serial, :bien_nacional, :pulgadas, :estatus]
  end

end
