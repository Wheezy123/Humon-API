class Event < ActiveRecord::Base
  has_many :attendances
  as_many :users, through: :attendances

  validates :lat, presence: true
  validates :lon, presence: true
  validates :name, presence: true
  validates :started_at, presence: true

  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
end
