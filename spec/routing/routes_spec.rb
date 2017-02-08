require "spec_helper"

describe 'routing' do
  it 'have homepage' do
    expect(get "/").to route_to "home#index"
  end
end
