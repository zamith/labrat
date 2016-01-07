class PagesController < ApplicationController
  def dashboard
    render locals: {
      width: Board::WIDTH,
      height: Board::HEIGHT,
      tubes: GroupedTubes.new
    }
  end

  private

  class GroupedTubes
    def initialize
      @tubes = all
    end

    def for(row, column)
      return if tubes.empty?
      return unless tubes[row]

      tubes[row][column]
    end

    private

    attr_reader :tubes

    def all
      Tube.all.each_with_object({}) do |tube, grouped|
        grouped[tube.row] ||= {}
        grouped[tube.row][tube.column] = tube
      end
    end
  end
end
