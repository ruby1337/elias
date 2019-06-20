# frozen_string_literal: true

require 'elias/api/application'

require 'rack/test'

RSpec.describe Elias::API::Application do
  subject(:response) { get '/' }

  include Rack::Test::Methods

  let(:app) { Elias::API::Application }

  describe 'GET /' do
    specify do
      expect(response.status).to eq 200
      expect(response.body).to eq <<~JSON.strip
        [{"id":1,"number":"ticket#1"},{"id":2,"number":"ticket#2"}]
      JSON
    end
  end
end
