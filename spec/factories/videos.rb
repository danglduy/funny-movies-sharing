FactoryBot.define do
  factory :video do
    video_url { Faker::Internet.url }
  end
end
