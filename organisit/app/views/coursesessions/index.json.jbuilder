json.array!(@coursesessions) do |coursesession|
  json.extract! coursesession, :id, :timeofday
  json.url coursesession_url(coursesession, format: :json)
end
