FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description] do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "#{n}@#{n}"
  end
end
