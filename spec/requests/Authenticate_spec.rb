require 'rails_helper'

#We need the user to not be able to access the gradebook
#This is to hopefully ensure that they cannot!
RSpec.describe "Home", type: :request do
    before do
        @user = create(:user)
    end

    describe "When signed in" do
        before do
            sign_in @user
        end

        it "should get index" do
            get root_path
            assert_response :success
        end
    end

    describe "when not signed in" do
        it "should not get index" do
            get root_path

            #We should expect the user to be reset to the sign in page!
            expect(response).to redirect_to(new_user_session_path)
        end
    end
end