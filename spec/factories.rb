FactoryGirl.define do
  factory :article do
  end

  factory :user do
  end

  factory :comment do
    association :author, :factory => :user
    content 'Awesome!'
  end
end
