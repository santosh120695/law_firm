class Tower < ApplicationRecord
    has_many :floors
    belongs_to :project

    attr_accessor :total_floor
    after_create :create_floors

    def create_floors
        self.total_floor.to_i.times do |index|
            Floor.create(name: index, tower_id: self.id )
        end
    end

    def total_units 
        Unit.where(id: self.floors.pluck(:id)).count
    end
end
