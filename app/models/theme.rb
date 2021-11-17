class Theme < ApplicationRecord
  has_many :theme_comments, dependent: :destroy
end
