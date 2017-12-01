json.extract! vent_log, :id, :organization, :contact, :notes, :phone, :email, :source, :cv_sent, :interest, :cv_version, :created_at, :updated_at
json.url vent_log_url(vent_log, format: :json)