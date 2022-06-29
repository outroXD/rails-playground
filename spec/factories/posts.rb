FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title-#{n}" }
    sequence(:body) { |n| "body-#{n}" }

    after(:create) do |post|
      create_list(:post_tag, 1, post: post, tag: create(:tag))
    end
  end
end
