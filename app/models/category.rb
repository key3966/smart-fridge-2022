class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '生鮮食品' },
    { id: 2, name: '野菜・果物' },
    { id: 3, name: '調味料' },
    { id: 4, name: '飲料' },
    { id: 5, name: '日用品' }
  ]

  include ActiveHash::Associations
  has_many :items
end
