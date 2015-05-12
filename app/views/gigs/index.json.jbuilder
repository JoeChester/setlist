json.array!(@gigs) do |gig|
  json.extract! gig, :id, :date, :location, :comment
  json.url gig_url(gig, format: :json)
end
