# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Test User"
    api_key "client_1_api_key"
  end
end
