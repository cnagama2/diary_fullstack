# == Schema Information
#
# Table name: diaries
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Diary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
