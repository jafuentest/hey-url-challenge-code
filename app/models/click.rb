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
class Click < ApplicationRecord
  belongs_to :url
end
