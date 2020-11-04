# frozen_string_literal: true

class LocalNgosController < ApplicationController
  def index
    @pagy, @local_ngos = pagy(current_program.local_ngos.order(sort_column + " " + sort_direction))
  end

  def new
    @local_ngo = authorize LocalNgo.new
  end

  def create
    @local_ngo = authorize current_program.local_ngos.new(local_ngo_params)

    if @local_ngo.save
      redirect_to local_ngos_url
    else
      render :new
    end
  end

  def edit
    @local_ngo = authorize LocalNgo.find(params[:id])
  end

  def update
    @local_ngo = authorize LocalNgo.find(params[:id])

    if @local_ngo.update_attributes(local_ngo_params)
      redirect_to local_ngos_url
    else
      render :edit
    end
  end

  def destroy
    @local_ngo = authorize LocalNgo.find(params[:id])
    @local_ngo.destroy

    redirect_to local_ngos_url
  end

  def import
    ProgramSpreadsheet.new(current_program.id).import(params[:file])

    redirect_to local_ngos_url
  end

  private
    def local_ngo_params
      params.require(:local_ngo).permit(:name, :province_id, :district_id, :commune_id, :village_id, :target_province_ids)
    end
end
