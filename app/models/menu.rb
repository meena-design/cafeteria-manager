class Menu < ActiveRecord::Base
  has_many :menu_items
  validates :name, { presence: true, uniqueness: true }
end
