class ManagerInfo < ActiveRecord::Base
  belongs_to :manager

  accepts_nested_attributes_for :manager, allow_destroy: true

  validates :name, :username, :cedula, :tlf, presence: true

end
