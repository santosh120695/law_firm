class Client < ApplicationRecord
    has_many :titles
    has_many :projects

    def total_earning
        self.titles.collect{|title| title.total_earned}.sum
    end
end

