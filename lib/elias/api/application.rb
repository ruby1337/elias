# frozen_string_literal: true

require 'elias/api/repositories/tickets'

require 'json'

module Elias
  module API
    Application = lambda do |*|
      tickets_repo = Elias::API::Repositories::Tickets.new
      tickets = tickets_repo.list
      [200, {}, [tickets.to_json]]
    end
  end
end
