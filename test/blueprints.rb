require 'machinist/active_record'
require 'sham'

Address.blueprint do
  street { Faker::Address.street_address }
  street_2
  city { Faker::Address.city }
  state { Faker::Address.us_state_abbr }
  zip{ Faker::Address.zip_code }
  country 'US'
  # belongs_to :addressable, :polymorphic => true
  addressable { Venue.make }
end

CmsPage.blueprint do
  reference_string { Sham.title }
  title
  body { Sham.description }
end

Gig.blueprint do
  time_start { Time.now }
  time_end { Time.now + 2.hours }
  description
  # belongs_to :venue  { Venue.make }
  venue
  # belongs_to :recording_session  { RecordingSession.make }  
  recording_session
end

Notification.blueprint do
  title
  body { Sham.description }
end

Recording.blueprint do
  notes { Sham.description }
  # paperclip
  track { Sham.document }
  # belongs_to :recording_session { RecordingSession.make }    
  recording_session
end

RecordingSession.blueprint do
  title
  description
  start_date { Time.now }
  end_date { Time.now + 2.weeks }
end

Song.blueprint do
  title
  lyrics { Sham.description }
  notes { Sham.description }
  composition_date  { Time.now }
  composition_location { Sham.title }
end

User.blueprint do
  email { Sham.email }
  password 'password' 
  password_confirmation 'password'
end

Venue.blueprint do
  name { Sham.title }
  location { Sham.title }
  description
  directions { Sham.description }
end

Sham.define do
  title { Faker::Lorem.words(5).join(' ') }
  name  { Faker::Name.name }
  description  { Faker::Lorem.paragraphs(3).join("\n\n") }
  email { Faker::Internet.email }
  document { Tempfile.new('the attached document') }
end