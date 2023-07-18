# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 6) }
    price { 100.00 }
    text { Faker::Lorem.sentence }
    tags { [{ name: 'tag1' }] }
  end
end
