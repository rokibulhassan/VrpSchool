class Depot < ActiveRecord::Base
  extend ApplicationHelper
  has_many :employees
  scope :re_order, -> { order('depots.index ASC') }

  def self.create_depots
    populate_depots
  end
end