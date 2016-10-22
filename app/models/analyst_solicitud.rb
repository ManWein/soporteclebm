class AnalystSolicitud < ActiveRecord::Base
  belongs_to :analyst
  belongs_to :solicitud
end