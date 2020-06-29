FactoryBot.define do
  factory :team do
    name { "MyString" }
    account { nil }
    timezone { "MyString" }
    has_reminder { false }
    has_recap { false }
    reminder_time { "2020-06-29 02:23:11" }
    recap_time { "2020-06-29 02:23:11" }
  end
end
