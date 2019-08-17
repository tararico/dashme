class Button < ApplicationRecord
  belongs_to :family
  has_many :items, dependent: :destroy
  has_one_attached :avatar

  # def thumbnail
  #   return self.variant(resize: '100x100').processed
  # end

end
