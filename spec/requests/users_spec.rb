require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  it "an example" do
    sign_in user
    get "/articles"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end
    
  end
end
