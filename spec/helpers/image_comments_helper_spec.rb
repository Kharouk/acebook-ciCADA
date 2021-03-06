# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ImagePostsHelper. For example:
#
# describe ImagePostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ImageCommentsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe '#find_comment_username' do
    it 'gets the correct email for a given image comment' do
      post = ImageComment.create(user_id: user.id, comment: 'test',
                                 image_post_id: 2)
      expect(helper.find_comment_username(post)).to eq 'wethebestmusic'
    end
  end

  describe '#find_image_comment_email' do
    it 'gets the correct email for a given image comment' do
      post = ImageComment.create(user_id: user.id, comment: 'test',
                                 image_post_id: 2)
      email = 'factory@mail.co'
      expect(helper.find_image_comment_email(post.user_id)).to eq email
    end
  end
end
