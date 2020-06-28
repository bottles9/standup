FactoryBot.define do
  factory :user do
    association :account, factory: :account, strategy: :build
    name { "MyString" }
    email {Faker::Internet.email}
    password {"123qwe"}
    password_confirmation {"123qwe"}
  end
end
