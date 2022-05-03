FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    resume { nil }
    deleted_at { "2022-05-03 15:38:17" }
  end
end
