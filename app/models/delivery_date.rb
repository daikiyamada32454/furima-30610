class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '__'},
    { id: 2, name: '即日'},
    { id: 3, name: '平日'},
    { id: 4, name: '祝日'},
    { id: 5, name: '1週間後'}
  ]
end
