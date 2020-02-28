require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  include LoginSupport

  xscenario "ユーザーは新しい投稿を作成する" do
    user = FactoryBot.create(:user)
    sign_in user
    click_on "fa-camera"
    expect do
      fill_in "micropost_content", with: "foobar"
      click_button "投稿"
    end.to change(user.microposts, :count).by(1)
  end
end
