# == Schema Information
#
# Table name:     game
#
#  id             :integer            not null, primary key
#  game_password  :string
#  game_status    :integer
#  created_at     :datetime           not null
#  updated_at     :datetime           not null
#
class Game < ApplicationRecord
  enum game_status: { pending: 0, active: 1, finished: 2 }
end
