class Event < ApplicationRecord
    validates :description, presence: true
    validates :date, presence: true
    belongs_to :user, class_name: "Creator"
end
