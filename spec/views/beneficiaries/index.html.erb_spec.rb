require 'rails_helper'

RSpec.describe "beneficiaries/index", type: :view do
  before(:each) do
    assign(:beneficiaries, [
      Beneficiary.create!(),
      Beneficiary.create!()
    ])
  end

  it "renders a list of beneficiaries" do
    render
  end
end
