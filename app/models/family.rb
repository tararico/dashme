class Family < ApplicationRecord
  has_many :users
  has_many :buttons
  has_many :invitations
  has_one :slack_workspace
end
