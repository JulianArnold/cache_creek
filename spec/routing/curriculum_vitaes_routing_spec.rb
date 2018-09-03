# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurriculumVitaesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/curriculum_vitaes').to route_to('curriculum_vitaes#index')
    end

    it 'routes to #new' do
      expect(get: '/curriculum_vitaes/new').to route_to('curriculum_vitaes#new')
    end

    it 'routes to #show' do
      expect(get: '/curriculum_vitaes/1').to route_to('curriculum_vitaes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/curriculum_vitaes/1/edit').to route_to('curriculum_vitaes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/curriculum_vitaes').to route_to('curriculum_vitaes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/curriculum_vitaes/1').to route_to('curriculum_vitaes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/curriculum_vitaes/1').to route_to('curriculum_vitaes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/curriculum_vitaes/1').to route_to('curriculum_vitaes#destroy', id: '1')
    end
  end
end
