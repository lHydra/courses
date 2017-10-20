FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@email.ru"
  end

  factory :user do
    email
    password 'qwerty'
    password_confirmation 'qwerty'

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :student do
      after(:create) { |user| user.add_role(:student) }
    end
  end
end
