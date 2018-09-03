# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::SubscriptionPlans', type: :request do
  describe 'GET /admin_subscription_plans' do
    it 'works! (now write some real specs)' do
      get admin_subscription_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
