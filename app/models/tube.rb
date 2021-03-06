class Tube < ActiveRecord::Base
  validates_presence_of :row, :column, :name
  validates_uniqueness_of :row, scope: :column

  has_paper_trail on: [:destroy]
end
