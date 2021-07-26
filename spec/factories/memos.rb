FactoryBot.define do

  factory :memo do
    memo_title {Faker::Name.last_name}
    memo {Faker::Name.last_name}
    frame_type_id {Faker::Number.within(range: 0..2)}
    association :user
  end
end
