FactoryBot.define do
  factory :item do
    association :user
    image                  {Faker::Lorem.sentence}
    name                   {"ああああ"}
    description            {"いいいい"}
    category_id            {3}
    status_id              {3}
    shippingcharges_id     {3}
    sender_id              {3}
    scheduleddelivery_id   {3}
    price                  {1000}

  end
end
