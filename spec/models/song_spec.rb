require 'spec_helper'

describe Song do
  describe "validations" do
    subject{Song.new}
    it{have_at_least(1).error_on(:title)}
    it{have_at_least(1).error_on(:url)}
    it{have_at_least(1).error_on(:playlist_id)}
  end

  describe "#youtube_id" do
    subject{ Song.new(url: "https://www.youtube.com/watch?v=i-OkwhQ6O2g").youtube_id }
    it{should eq("i-OkwhQ6O2g")} 
  end
end
