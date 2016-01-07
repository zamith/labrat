class PagesController < ApplicationController
  def dashboard
    render locals: {
      width: Board::WIDTH,
      height: Board::HEIGHT
    }
  end
end
