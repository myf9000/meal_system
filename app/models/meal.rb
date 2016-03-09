class Meal < ActiveRecord::Base
	has_one :order

	VALID_REGEX = /\A^[\w \.\-]*$\Z/
	validates :name, presence: true, length: { in: 2..30}, format: { with: VALID_REGEX }
	validates :cost, presence: true, numericality: true

	def as_json(options)
	  super(options.merge(include: :order))
	end
end
