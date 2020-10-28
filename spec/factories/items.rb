FactoryBot.define do
  factory :item do
    association :user
    name                   {"ああああ"}
    description            {"いいいい"}
    category_id            {3}
    status_id              {3}
    shippingcharges_id     {3}
    sender_id              {3}
    scheduleddelivery_id   {3}
    price                  {1000}
    after(:build) do |i|
      i.image.attach(io: File.open('public/test.jpg'), filename: 'test.jpg')
    end
  end
end
