FactoryGirl.define do
  factory :user do
    name     "dj moonbat"
    email    "dj.moonbat@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end