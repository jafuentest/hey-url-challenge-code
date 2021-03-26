# frozen_string_literal: true

# == Schema Information
#
# Table name: urls
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  short_url    :string           not null
#  original_url :string           not null
#  clicks_count :integer          default(0)
#
require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validations' do
    it 'validates original URL is a valid URL' do
      skip 'add test'
    end

    it 'validates short URL is present' do
      skip 'add test'
    end

    # add more tests
  end
end
