FactoryBot.define do
  factory :order do
    slug { "MyString" }
    price { 1 }
    ststus { "MyString" }
    resume { nil }
    user { nil }
  end
end
