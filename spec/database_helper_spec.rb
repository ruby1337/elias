# frozen_string_literal: true

require 'database_helper'

RSpec.describe 'factory' do
  context 'when `db: true` is specified', :db do
    it { expect(factory).to be }
  end
end
