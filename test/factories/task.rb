FactoryBot.define do
  factory :task do
    name { generate :string }
    description { generate :string }
    author_id { nil }
    assignee_id { nil }
  end
end

