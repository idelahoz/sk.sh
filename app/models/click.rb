class Click < ApplicationRecord
  belongs_to :url, counter_cache: true
  scope :descendent, -> { order(id: :desc) }
end
