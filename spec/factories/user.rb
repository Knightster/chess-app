FactoryGirl.define do
  factory :user do
    email "John@example.com"
    password "password123"
    password_confirmation "password123"
  end
end