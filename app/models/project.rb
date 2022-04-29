class Project < ApplicationRecord
  belongs_to :client
  has_many :towers

  def total_towers
    self.towers.count 
  end

  def total_units
    Unit.where(tower_id: self.towers.pluck(:id)).count 
  end
end
