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

  def show
    versions = PaperTrail::Version.where_object(
      row: params[:row],
      column: params[:column]
    ).order(created_at: :desc)

    render locals: {
      tube: Tube.includes(:versions).find(params[:id]),
      versions: versions.map(&:reify)
    }
  end

  def edit
    render locals: {
      tube: Tube.find(params[:id])
    }
  end

  def destroy
    Tube.find(params[:id]).destroy

    redirect_to root_path
  end

  private

  def tube_params
    params.
      require(:tube).
      permit(:name, :description, :row, :column)
  end
end
