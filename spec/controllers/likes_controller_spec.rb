# require 'rails_helper'
#
# RSpec.describe LikesController, type: :controller do
#   let(:user) { create(:user) }
#   let!(:micropost) { create(:micropost) }
#   let!(:like) { create(:like, user_id: user.id, micropost_id: micropost.id) }
#
#   describe "MICROPOST #create" do
#     before do
#       login_user user
#     end
#
#     it "" do
#       post :create, format: :json,
#       params: { micropost_id: micropost.id, id: like.id }
#       expect(response.content_type).to eq "application/js"
#     end
#
#     it "" do
#       expect { micropost :create, format: :json, params: { micropost_id: micropost.id, id: like.id } }.to change{ Like.count }.by(1)
#     end
#   end
# end