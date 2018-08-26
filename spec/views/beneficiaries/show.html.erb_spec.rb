require 'rails_helper'

RSpec.describe "beneficiaries/show", type: :view do
  before(:each) do
    @beneficiary = assign(:beneficiary, Beneficiary.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
