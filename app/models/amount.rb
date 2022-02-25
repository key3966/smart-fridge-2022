class Amount < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'なし' },
    { id: 2, name: '残りわずか' },
    { id: 3, name: '半分程度' },
    { id: 4, name: 'たくさん' }
  ]

  include ActiveHash::Associations
  has_many :items
end
