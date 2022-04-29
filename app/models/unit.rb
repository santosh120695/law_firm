class Unit < ApplicationRecord

  attr_accessor :project_id
  belongs_to :tower
  belongs_to :floor
end
