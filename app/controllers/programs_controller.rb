# frozen_string_literal: true

class ProgramsController < ApplicationController
  def index
    @pagy, @programs = pagy(authorize Program.all)
  end

  def show
    @program = authorize Program.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @program = authorize Program.new
  end

  def create
    @program = authorize Program.new(program_params)

    if @program.save
      redirect_to programs_url
    else
      render :new
    end
  end

  def edit
    @program = authorize Program.find(params[:id])
  end

  def update
    @program = authorize Program.find(params[:id])

    if @program.update(program_params)
      redirect_to programs_url
    else
      render :edit
    end
  end

  def destroy
    @program = authorize Program.find(params[:id])
    @program.destroy

    redirect_to programs_url
  end

  def es_reindex
    @program = authorize Program.find(params[:id])
    @program.reindex_documents

    redirect_to programs_url, notice: t("program.reindex_successfully")
  end

  private
    def program_params
      params.require(:program).permit(:name, :shortcut_name,
        program_scorecard_types_attributes: [:id, :code, :name_en, :name_km]
      )
    end
end
