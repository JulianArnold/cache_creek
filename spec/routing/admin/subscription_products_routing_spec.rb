# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SubscriptionProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/subscription_products').to route_to('admin/subscription_products#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/subscription_products/new').to route_to('admin/subscription_products#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/subscription_products/1').to route_to('admin/subscription_products#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/subscription_products/1/edit').to route_to('admin/subscription_products#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/subscription_products').to route_to('admin/subscription_products#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/subscription_products/1').to route_to('admin/subscription_products#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/subscription_products/1').to route_to('admin/subscription_products#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/subscription_products/1').to route_to('admin/subscription_products#destroy', id: '1')
    end
  end
end
