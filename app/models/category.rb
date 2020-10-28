class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: 'バック'},
    { id: 3, name: 'クツ'},
    { id: 4, name: '財布'},
    { id: 5, name: 'その他'}
  ]
end
