FactoryGirl.define do
  factory :article do; end

  factory :user do; end

  factory :comment do
    association :user
    realm_uuid '64d3a190d945012d4b2158b035f038ab'
    content 'Awesome!'
  end
end
