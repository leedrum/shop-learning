class Category < ApplicationRecord
  has_ancestry

  validates :name, presence: true

  ATTRIBUTES_CREATE = %w(name parent_id)
  ATTRIBUTES_UPDATE = %w(name parent_id)
end
