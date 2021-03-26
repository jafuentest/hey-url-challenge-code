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

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)$/i
      record.errors.add attribute, (options[:message] || 'is not a valid URL')
    end
  end
end

class Url < ApplicationRecord
  # scope :latest, -> {}
  validates :original_url, url: true

  before_create :set_short_url

  def set_short_url
    self.short_url = generate_short_url
  end

  def generate_short_url
    s = ''
    i = (self.class.maximum(:id) || 0)
    while i > 0
      mod = i % 26
      s = (mod + 65).chr + s
      i /= 26
    end
    s.size < 5 ? 'A' * (5 - s.size) + s : s
  end
end
