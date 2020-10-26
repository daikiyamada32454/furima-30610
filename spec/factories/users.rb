FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {"aaabbC1"}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}   
    family_name_kana      {Gimei.last.katakana}
    first_name            {Gimei.first.kanji}
    first_name_kana       {Gimei.first.katakana}
    birthday              {"1997-11-14"}
  end
end