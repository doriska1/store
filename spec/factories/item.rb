# frozen_string_literal: true

FactoryBot.define do |var|
  factory :item do
    name { Faker::Lorem.characters(number: 6) }
    price { 100.00 }
    text { Faker::Lorem.sentence }
    tags { [{ name: 'tag1' }] }
    user_id { var }
  end
end
