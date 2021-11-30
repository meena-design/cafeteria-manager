class Menu < ActiveRecord::Base
  has_many :menu_items
  validates :name, presence: true
  #validates :name, { presence: true, uniqueness: true }

  def self.getActiveMenuName
    all.find(ActiveMenu.first.active_menu)
    #.name
  end
end
