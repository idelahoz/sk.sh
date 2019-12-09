class Url < ApplicationRecord
  has_many :clicks
  scope :descendent, -> { order(id: :desc) }
  before_create :set_access_token

  validates :token, uniqueness: true

  private

  def set_access_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(5)
      break token unless Url.where(token: token).exists?
    end
  end
end
