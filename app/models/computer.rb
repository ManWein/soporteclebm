class Computer < ActiveRecord::Base
  has_one :keyboard
  has_one :screen
  has_one :mouse
  has_one :regulator

  accepts_nested_attributes_for :keyboard
  accepts_nested_attributes_for :screen
  accepts_nested_attributes_for :mouse
  accepts_nested_attributes_for :regulator

  def self.permited_params
    [:marca, :modelo, :serial, :bien_nacional, :tarjeta_madre, :procesador, :memoria_ram, :disco_duro, :cdrom, :sistema_operativo, :en_red, :software_extra, :estatus_servicio, :tipo]
  end

end
