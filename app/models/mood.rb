class Mood < ApplicationRecord
    validates :name, presence: true
end
