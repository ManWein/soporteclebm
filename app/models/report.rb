class Report < ActiveRecord::Base
  belongs_to :solicitud

  accepts_nested_attributes_for :solicitud, allow_destroy: true

  def self.permited_params
    [:solicitud_id, :tipo_servicio, :detalle_servicio, :estatus]
  end

end