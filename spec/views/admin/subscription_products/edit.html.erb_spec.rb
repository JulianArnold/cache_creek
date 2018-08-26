require 'rails_helper'

RSpec.describe "admin/subscription_products/edit", type: :view do
  before(:each) do
    @admin_subscription_product = assign(:admin_subscription_product, Admin::SubscriptionProduct.create!(
      :lock_version => 1,
      :name => "MyString",
      :description => "MyText",
      :curriculum_vitae_limited => false,
      :curriculum_vitae_limit => 1,
      :opportunity_limited => false,
      :opportunity_limit => 1,
      :organisation_limited => false,
      :organisation_limit => 1,
      :person_limited => false,
      :person_limit => 1
    ))
  end

  it "renders the edit admin_subscription_product form" do
    render

    assert_select "form[action=?][method=?]", admin_subscription_product_path(@admin_subscription_product), "post" do

      assert_select "input#admin_subscription_product_lock_version[name=?]", "admin_subscription_product[lock_version]"

      assert_select "input#admin_subscription_product_name[name=?]", "admin_subscription_product[name]"

      assert_select "textarea#admin_subscription_product_description[name=?]", "admin_subscription_product[description]"

      assert_select "input#admin_subscription_product_curriculum_vitae_limited[name=?]", "admin_subscription_product[curriculum_vitae_limited]"

      assert_select "input#admin_subscription_product_curriculum_vitae_limit[name=?]", "admin_subscription_product[curriculum_vitae_limit]"

      assert_select "input#admin_subscription_product_opportunity_limited[name=?]", "admin_subscription_product[opportunity_limited]"

      assert_select "input#admin_subscription_product_opportunity_limit[name=?]", "admin_subscription_product[opportunity_limit]"

      assert_select "input#admin_subscription_product_organisation_limited[name=?]", "admin_subscription_product[organisation_limited]"

      assert_select "input#admin_subscription_product_organisation_limit[name=?]", "admin_subscription_product[organisation_limit]"

      assert_select "input#admin_subscription_product_person_limited[name=?]", "admin_subscription_product[person_limited]"

      assert_select "input#admin_subscription_product_person_limit[name=?]", "admin_subscription_product[person_limit]"
    end
  end
end
