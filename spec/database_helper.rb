# frozen_string_literal: true

require 'elias/settings'

module Elias
  module Test
    class Factory
      attr_reader :db

      # @param db [Sequel::Database]
      def initialize(db:)
        @db = db
      end

      def [](relation, attributes = {})
        db[relation].insert(attributes)
      end

      def struct(relation, attributes = {})
        id = self[relation, attributes]
        db[relation][id: id]
      end
    end
  end
end

RSpec.configure do |config|
  config.around(:each, :db) do |example|
    Elias::DB.transaction do
      example.run
    ensure
      raise Sequel::Rollback
    end
  end

  config.include (Module.new do
    def factory
      Elias::Test::Factory.new(db: Elias::DB)
    end
  end), db: true
end
