FactoryBot.define do
  factory :reply do
    user { nil }
    comment { nil }
    body { "MyString" }
  end
end
