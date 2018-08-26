require 'rails_helper'

RSpec.describe "beneficiaries/new", type: :view do
  before(:each) do
    assign(:beneficiary, Beneficiary.new())
  end

  it "renders new beneficiary form" do
    render

    assert_select "form[action=?][method=?]", beneficiaries_path, "post" do
    end
  end
end
