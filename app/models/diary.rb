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

class Diary < ApplicationRecord
end
