class Amount < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'なし' },
    { id: 2, name: '少ない' },
    { id: 3, name: '半分くらい' },
    { id: 4, name: 'たくさん' }
  ]

  include ActiveHash::Associations
  has_many :items
end
