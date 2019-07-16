# frozen_string_literal: true

require 'elias/api/application'

require 'rack/test'

RSpec.describe Elias::API::Application, :db do
  subject(:response) { get '/' }

  include Rack::Test::Methods

  let(:app) { Elias::API::Application }

  let!(:tickets) do
    [
      factory.struct(:tickets, ticket_no: 'ticket#1'),
      factory.struct(:tickets, ticket_no: 'ticket#2')
    ]
  end

  describe 'GET /' do
    specify do
      expect(response.status).to eq 200
      expect(response.body).to eq <<~JSON.strip
        [{"id":#{tickets[0][:id]},"ticket_no":"ticket#1     "},{"id":#{tickets[1][:id]},"ticket_no":"ticket#2     "}]
      JSON
    end
  end
end
