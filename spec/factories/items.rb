# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    spec { [ 'SAMPLE', 'PRODUCT', 'HELP', 'POINTS' ].sample }
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    content 'html'
    show_after_seconds 5


    factory :item_with_beacon do
      association :beacon, factory: :beacon
    end

  end
end
