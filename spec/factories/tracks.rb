FactoryBot.define do
  factory :track do
    artist { "MyString" }
    trackname { "MyString" }
    album { "MyString" }
    year { 1 }
    genre { "MyString" }
    play_preview_url { "MyString" }
    album_img_url { "MyString" }
    playlist { nil }
  end
end
