FactoryGirl.define do
  factory :user do
    name     "Jaap Wijnen"
    email    "jaap@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end