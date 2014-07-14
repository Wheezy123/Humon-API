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
      'id' => event.id
      'lat' => event.lat
      'lon' => event.lon
      'name' => event.name
      'started_at' => event.started_at.as_json,
      'owner' => {
        'device_token' => event.owner.device_token
      }
    })
  end
end