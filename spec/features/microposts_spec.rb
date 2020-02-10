require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  scenario "ユーザーは新しいプロジェクトを作成する" do
    user = FactoryBot.create(:user)
    
    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    
    expect {
      click_link "CloneApp"
      fill_in "micropost_content", with: "foobar"
      click_button "投稿"
    }.to change(user.microposts, :count).by(1)
  end
end
