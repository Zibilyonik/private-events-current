class User < ActiveRecord::Base
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :events, dependent: :destroy
    has_many :attendances
    has_many :attended_events, through: :attendances, source: :event, foreign_key: :event_id
  end