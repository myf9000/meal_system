class Idea < ActiveRecord::Base
  belongs_to :user

  VALID_REGEX = /\A^[\w \.\-]*$\Z/
  validates :user_id, presence: true
  validates :name, presence: true,  length: { in: 2..30}, format: { with: VALID_REGEX }
  validates :desc, presence: true,  length: { in: 2..80}, format: { with: VALID_REGEX }
end
