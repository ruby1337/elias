# frozen_string_literal: true

Sequel.migration do # rubocop:disable Metrics/BlockLength
  change do # rubocop:disable Metrics/BlockLength
    create_table(:airports) do
      primary_key :id
      String :airport_code, size: 3, fixed: true, null: false
      String :airport_name, null: false
      String :city, null: false
      String :coordinates, null: false
      String :timezone, text: true, null: false
    end

    create_table(:tickets) do
      primary_key :id
      String :ticket_no, size: 13, fixed: true, null: false
    end

    create_table(:flights) do
      primary_key :id
      String :flight_no, size: 6, fixed: true, null: false
      DateTime :scheduled_departure, null: false
      DateTime :scheduled_arrival, null: false
      foreign_key :departure_airport, :airports, null: false
      foreign_key :arrival_airport, :airports, null: false
      String :status, size: 20, null: false
      DateTime :actual_departure
      DateTime :actual_arrival
    end

    create_table(:ticket_flights) do
      primary_key :id
      foreign_key :ticket_id, :tickets, null: false
      foreign_key :flight_id, :flights, null: false
      index %i[ticket_id flight_id]
    end
  end
end
