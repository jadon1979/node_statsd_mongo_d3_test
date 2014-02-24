# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "Test page 1"
    slug "test-page-1"
    body "Some Text"
    user 1
  end
end
