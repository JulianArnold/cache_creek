# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SubscriptionPlansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/subscription_plans').to route_to('admin/subscription_plans#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/subscription_plans/new').to route_to('admin/subscription_plans#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/subscription_plans/1').to route_to('admin/subscription_plans#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/subscription_plans/1/edit').to route_to('admin/subscription_plans#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/subscription_plans').to route_to('admin/subscription_plans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/subscription_plans/1').to route_to('admin/subscription_plans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/subscription_plans/1').to route_to('admin/subscription_plans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/subscription_plans/1').to route_to('admin/subscription_plans#destroy', id: '1')
    end
  end
end
