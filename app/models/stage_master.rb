class StageMaster < ApplicationRecord
    belongs_to :item, polymorphic: true
end
