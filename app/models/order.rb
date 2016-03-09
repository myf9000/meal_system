class Order < ActiveRecord::Base
  belongs_to :meal
  belongs_to :user

  VALID_REGEX = /\A^[\w \.\-]*$\Z/
  validates :user_id, presence: true
  validates :status, presence: true,  length: { in: 2..30}, format: { with: VALID_REGEX }

  def as_json(options)
    super(options.merge(include: :meal))
  end
end
