# frozen_string_literal: true

module Elias
  SETTINGS = {
    database_url: ENV.fetch('DATABASE_URL')
  }.freeze

  require 'sequel'
  DB = Sequel.connect(SETTINGS[:database_url])
end
