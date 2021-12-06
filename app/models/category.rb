class Category < ApplicationRecord
  has_ancestry

  validates :name, presence: true

  ATTRIBUTES_CREATE = %w(name)
end
