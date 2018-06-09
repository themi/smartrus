FactoryBot.define do

  factory :student  do
    sequence(:email)      { |n| "email+student#{n}@example.com" }
    first_name            { FFaker::Name.first_name }
    last_name             { FFaker::Name.last_name }
    password              { 'Password1!' }
    after :create do |user, options|
      user.confirm
    end
  end

  factory :supervisor do
    sequence(:email)      { |n| "email+supervisor#{n}@example.com" }
    first_name            { FFaker::Name.first_name }
    last_name             { FFaker::Name.last_name }
    password              { 'Password1!' }
    after :create do |user, options|
      user.confirm
    end
  end

  factory :admin do
    sequence(:email)      { |n| "email+admin#{n}@example.com" }
    first_name            { FFaker::Name.first_name }
    last_name             { FFaker::Name.last_name }
    password              { 'Password1!' }
    after :create do |user, options|
      user.confirm
    end
  end

end
