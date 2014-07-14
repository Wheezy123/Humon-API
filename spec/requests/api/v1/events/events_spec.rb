require 'spec_helper'
## Anytime you see the method response_json, it should be ￼JSON.parse(response.body)
## so response_json = JSON.parse(response.body)

describe 'GET /v1/events/:id' do
  it 'returns an event by :id' do
    event = create(:event)

    get "/v1/events/#{event.id}"

    expect(JSON.parse(response.body)).to eq(
    {
      'address' => event.address, 
      'ended_at' => event.ended_at, 
      'id' => event.id,
      'lat' => event.lat,
      'lon' => event.lon,
      'name' => event.name,
      'started_at' => event.started_at.as_json,
      'owner' => {
        'device_token' => event.owner.device_token
      }
    })
  end
end

describe 'POST /v1/events' do
  it 'saves the address, lat, lon, name, and started_at date' do
    date = Time.zone.now
    device_token = '123abcd456xyz'
    owner = FactoryGirl.create(:user, device_token: device_token)

    post '/v1/events', {
      address: '123 Fake st.',
      ended_at: date,
      lat: 1.0,
      lon: 1.0,
      name: 'Fun Place!',
      started_at: date,
      owner: {
        device_token: device_token
      }
    }.to_json, { 'Content-Type' => 'application/json' }

    event = Event.last
    expect(JSON.parse(response.body)).to eq({'id' => event.id})
    expect(event.address).to eq '123 Fake st.'
    expect(event.ended_at.to_i).to eq date.to_i
    expect(event.lat).to eq 1.0
    expect(event.lon).to eq 1.0
    expect(event.name).to eq 'Fun Place!'
    expect(event.started_at.to_i).to eq date.to_i
    expect(event.owner).to eq owner
  end

  describe "it returns an error message when invalid" do
    post '/v1/events',
    {}.to_json,
    { 'Content-Type' => 'application/json' }

    expect(JSON.parse(response.body)).to eq({
        'message' => 'Validation Failed', 
        'errors' => [
        "Lat can't be blank",
        "Lon can't be blank",
        "Name can't be blank", "Started at can't be blank"
      ]
    })
    expect(response.code.to_i).to eq 422
  end
end






































