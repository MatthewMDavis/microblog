FactoryGirl.define do
  factory :user do |u|
    u.sequence(:name)   { |n| "Person #{n}" }
    u.sequence(:email)  { |n| "person_#{n}@example.com" }
    u.password "foobar"
    u.password_confirmation "foobar"

    # create sub-category of admin
    factory :admin do
      admin true
    end
  end
end