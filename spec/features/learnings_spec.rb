require "rails_helper"

RSpec.feature "Learnings", type: :feature do
  include LoginSupport

  xscenario "ユーザーは新しい学習を登録する" do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    expect do
      fill_in "learnings_learning_time", with: 480
      fill_in "learnings_subject", with: "Rails"
      fill_in "learnings_content", with: "foobar"
      click_on "記録する"
    end.to change(user.learnings, :count).by(1)
  end
end
