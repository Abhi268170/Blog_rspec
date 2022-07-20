FactoryBot.define do
  factory :article do
    title { "John" }
    body  { "Doe" }
    id { 1 }
  end
  factory :comment do

    body  { "hello" }
    article
  end
end