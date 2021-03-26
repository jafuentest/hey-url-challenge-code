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

class Url < ApplicationRecord
  # scope :latest, -> {}
end
