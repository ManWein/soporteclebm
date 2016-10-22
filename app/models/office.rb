class Office < ActiveRecord::Base

  def self.permited_params
    [:nombre, :estatus]
  end

end