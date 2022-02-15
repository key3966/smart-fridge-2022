class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '生鮮' },
    { id: 2, name: '野菜・果物' },
    { id: 3, name: '飲料' },
  ]

  include ActiveHash::Associations
  has_many :items

  end