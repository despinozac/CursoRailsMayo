class Profile < ActiveRecord::Base

  belongs_to :user

  validates :zip_code, presence: true
  validate :zip

  private

  def zip
    errors.add(:zip_code, "El zip debe ser par") unless zip_code.even?
  end
end