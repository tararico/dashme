class Button < ApplicationRecord
  has_many :items
  has_one_attached :avatar

  # def thumbnail
  #   return self.variant(resize: '100x100').processed
  # end

end
