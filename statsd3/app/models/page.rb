class Page < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  
end
