# frozen_string_literal: true

# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url_id     :bigint
#  browser    :string           not null
#  platform   :string           not null
#
require 'rails_helper'

RSpec.describe Click, type: :model do
  describe 'validations' do
    it 'validates url_id is valid' do
      skip 'add test'
    end

    it 'validates browser is not null' do
      skip 'add test'
    end

    it 'validates platform is not null' do
      skip 'add test'
    end
  end
end
