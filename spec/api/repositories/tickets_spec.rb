# frozen_string_literal: true

require 'elias/api/repositories/tickets'

RSpec.describe Elias::API::Repositories::Tickets, :db do
  subject(:repository) { described_class.new }

  describe '#list' do
    subject(:tickets_data) { repository.list }

    let!(:tickets) do
      [
        factory[:tickets, ticket_no: '#00001'],
        factory[:tickets, ticket_no: '#00002']
      ]
    end

    it 'returns list of of tickets' do
      expect(tickets_data).to eq [
        { id: tickets[0], ticket_no: '#00001       ' },
        { id: tickets[1], ticket_no: '#00002       ' }
      ]
    end
  end
end
