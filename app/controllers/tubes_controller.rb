class TubesController < ApplicationController
  def new
    render locals: {
      tube: Tube.new,
      row: params[:row],
      column: params[:column]
    }
  end

  def create
    @tube = Tube.new tube_params
    if @tube.save
      redirect_to root_path
    else
      render :new, locals: {
        tube: @tube,
        row: @tube.row,
        column: @tube.column
      }
    end
  end

  private

  def tube_params
    params.
      require(:tube).
      permit(:name, :description, :row, :column)
  end
end
