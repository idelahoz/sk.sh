class Url < ApplicationRecord
  has_many :clicks, counter_cache: true

  scope :descendent, -> { order(id: :desc) }
end
