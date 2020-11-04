FactoryBot.define do
  factory :user_order do
    post_number          {"111-1111"}
    sender_id            {2}
    municipality        {"大阪"}
    address             {"大阪市"}
    building_name       {"ダミー"}
    phone_number        {"11111111111"}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end