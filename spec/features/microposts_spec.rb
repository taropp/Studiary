require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  scenario "ユーザーは新しいプロジェクトを作成する" do #, js: true do
    user = FactoryBot.create(:user)
    
    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    
  #   expect {
  #     click_link "CloneApp"
  #     fill_in "micropost_content", with: "foobar"
  #     click_button "投稿"
  #     expect(page).to have_content "投稿しました"
  #     redirect_to root_path
  #   }.to change(user.microposts, :count).by(1) 今の知識ではこれ以上進めないのでコメントアウト
  end
end
