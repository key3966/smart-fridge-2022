class Amount < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'なし' },
    { id: 3, name: '少ない' },
    { id: 4, name: '半分程度' },
    { id: 5, name: '多い' },
  ]

  include ActiveHash::Associations
  has_many :items

  end