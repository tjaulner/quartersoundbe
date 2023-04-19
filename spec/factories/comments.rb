FactoryBot.define do
  factory :comment do
    user_id { "" }
    body { "MyString" }
    parent_id { 1 }
    post_id { 1 }
  end
end
