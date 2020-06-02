class User < ActiveRecord::Base
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :events, dependent: :destroy
  end