json.extract! person, :id, :first_name, :last_name, :email, :phone, :organisation_id, :linkedin_profile_url, :next_contact_on, :source_of_contact, :cv_sent_on, :cv_version, :status, :created_at, :updated_at
json.url person_url(person, format: :json)
