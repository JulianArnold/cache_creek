# frozen_string_literal: true

json.extract! organisation, :id, :name, :postal_address, :phone, :created_at, :updated_at
json.url organisation_url(organisation, format: :json)
