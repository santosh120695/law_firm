class Stage < ApplicationRecord
  belongs_to :stage_master
  belongs_to :item, polymorphic: true
end
