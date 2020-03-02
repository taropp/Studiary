require 'rails_helper'

RSpec.feature 'Pages', type: :feature do
  include LoginSupport

  xscenario "ログインする" do
    user = FactoryBot.create(:user)
    sign_in user
    expect(respond_to).to root_path
  end
end
