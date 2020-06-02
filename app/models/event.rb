class Event < ApplicationRecord
    validates :description, presence: true
    validates :date, presence: true
    belongs_to :creator, class_name: "User", foreign_key: :user_id
end
