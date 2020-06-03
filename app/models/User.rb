class User < ActiveRecord::Base
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :events, dependent: :destroy
    has_many :attended_events, through: :attendances, class_name: "event", foreign_key: :event_id
  end