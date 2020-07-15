class Event < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_one_attached :image

  validates_presence_of :name, :start_time, :end_time

  validates_datetime :start_time,
                     on_or_after: -> { Time.current },
                     on_or_after_message: "can't be older than current time"
  validates_datetime :end_time,
                     after: :start_time,
                     after_message: "can't be older than start time"
  validates_with OverlapsValidator, on: %i[create update]

  # scopes
  scope :active, -> { where(active: true) }

  def toggle_active!
    self.active = !active
    save!(validate: false)
  end
end
