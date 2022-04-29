class Tower < ApplicationRecord
    has_many :floors

    attr_accessor :total_floor
    after_create :create_floors

    def create_floors
        self.total_floor.to_i.times do |index|
            Floor.create(name: index, tower_id: self.id )
        end
    end
end
