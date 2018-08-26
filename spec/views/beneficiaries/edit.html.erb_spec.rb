require 'rails_helper'

RSpec.describe "beneficiaries/edit", type: :view do
  before(:each) do
    @beneficiary = assign(:beneficiary, Beneficiary.create!())
  end

  it "renders the edit beneficiary form" do
    render

    assert_select "form[action=?][method=?]", beneficiary_path(@beneficiary), "post" do
    end
  end
end
