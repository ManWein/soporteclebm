class AnalystInfo < ActiveRecord::Base
  belongs_to :analyst

  accepts_nested_attributes_for :analyst, allow_destroy: true

  validates :name, :username, presence: true

end
