FactoryGirl.define do

  factory :user do |u|
    u.sequence(:id)    { |n| "#{n}" }
    u.sequence(:email) { |n| "rakesh#{n}verma@example.com"}
    u.password "password"
  end

end
