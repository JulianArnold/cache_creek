require 'rails_helper'

RSpec.describe "admin/subscription_products/show", type: :view do
  before(:each) do
    @admin_subscription_product = assign(:admin_subscription_product, Admin::SubscriptionProduct.create!(
      :lock_version => 2,
      :name => "Name",
      :description => "MyText",
      :curriculum_vitae_limited => false,
      :curriculum_vitae_limit => 3,
      :opportunity_limited => false,
      :opportunity_limit => 4,
      :organisation_limited => false,
      :organisation_limit => 5,
      :person_limited => false,
      :person_limit => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/6/)
  end
end
