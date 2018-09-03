# frozen_string_literal: true

json.extract! opportunity, :id, :organisation_id, :person_id, :job_title, :job_description, :category, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
