require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  include LoginSupport
  
  scenario "ユーザーは新しいプロジェクトを作成する" do
    user = FactoryBot.create(:user)
    sign_in user
    visit root_path
    expect {
      click_link "CloneApp"
      fill_in "micropost_content", with: "foobar"
      click_button "投稿"
    }.to change(user.microposts, :count).by(1)
  end
end
