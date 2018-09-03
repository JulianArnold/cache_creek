# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/subscription_products/index', type: :view do
  before(:each) do
    assign(:admin_subscription_products, [
             Admin::SubscriptionProduct.create!(
               lock_version: 2,
               name: 'Name',
               description: 'MyText',
               curriculum_vitae_limited: false,
               curriculum_vitae_limit: 3,
               opportunity_limited: false,
               opportunity_limit: 4,
               organisation_limited: false,
               organisation_limit: 5,
               person_limited: false,
               person_limit: 6
             ),
             Admin::SubscriptionProduct.create!(
               lock_version: 2,
               name: 'Name',
               description: 'MyText',
               curriculum_vitae_limited: false,
               curriculum_vitae_limit: 3,
               opportunity_limited: false,
               opportunity_limit: 4,
               organisation_limited: false,
               organisation_limit: 5,
               person_limited: false,
               person_limit: 6
             )
           ])
  end

  it 'renders a list of admin/subscription_products' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 5.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 6.to_s, count: 2
  end
end
