class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates_presence_of :name, :start_time, :end_time

  # scopes
  scope :active, -> { where(active: true) }

end
