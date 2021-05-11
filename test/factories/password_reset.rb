FactoryBot.define do
  factory :password_reset do
    token { generate :string }
    token_created_at { generate :string }
  end
end
