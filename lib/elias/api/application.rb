# frozen_string_literal: true

require 'json'

module Elias
  module API
    Application = lambda do |*|
      tickets = [
        { id: 1, number: 'ticket#1' },
        { id: 2, number: 'ticket#2' }
      ]
      [200, {}, [tickets.to_json]]
    end
  end
end
