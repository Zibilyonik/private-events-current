class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  scope :past, -> { where('date < ?', Time.current) }
  scope :upcoming, -> { where('date > ?', Time.current) }
end
