# frozen_string_literal: true

module Elias
  module API
    module Repositories
      class Tickets
        attr_reader :db
        attr_reader :root

        def initialize(db: Elias::DB, root: :tickets)
          @db = db
          @root = db[root]
        end

        def list
          root.to_a
        end
      end
    end
  end
end
