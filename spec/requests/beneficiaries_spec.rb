require 'rails_helper'

RSpec.describe "Beneficiaries", type: :request do
  describe "GET /beneficiaries" do
    it "works! (now write some real specs)" do
      get beneficiaries_path
      expect(response).to have_http_status(200)
    end
  end
end
