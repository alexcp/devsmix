require 'spec_helper'

describe PlaylistsController do
  before :all do
    @playlist = create(:playlist)
  end

  let(:valid_attributes) { attributes_for(:playlist) }

  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested playlist as @playlist" do
      get :show, {:id => @playlist.to_param}, valid_session
      expect(assigns(:playlist)).to eq(@playlist)
    end
  end
end
