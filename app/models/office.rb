class Office < ActiveRecord::Base
  has_one :applicant_info

  def self.permited_params
    [:nombre, :estatus]
  end

  def set_nombre
    self.nombre.blank? ? "N/A" : self.nombre
  end
end