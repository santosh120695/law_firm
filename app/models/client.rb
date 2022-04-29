class Client < ApplicationRecord
    has_many :titles
    has_many :projects
end

