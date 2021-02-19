# frozen_string_literal: true

class FacilitiesController < ApplicationController
  def index
    respond_to do |format|
      format.html {
        @pagy, @facilities = pagy(current_program.facilities.roots.reorder(sort_column + " " + sort_direction).includes(:children))
      }

      format.json {
        render json: current_program.facilities.roots
      }
    end
  end

  def children
    @facility = Facility.find(params[:id])

    render json: @facility.children
  end

  def new
    @facility = authorize Facility.new
  end

  def create
    @facility = authorize current_program.facilities.new(facility_params)

    if @facility.save
      redirect_to facilities_url
    else
      render :new
    end
  end

  def edit
    @facility = authorize Facility.find(params[:id])
  end

  def update
    @facility = authorize Facility.find(params[:id])

    if @facility.update_attributes(facility_params)
      redirect_to facilities_url
    else
      render :edit
    end
  end

  def destroy
    @facility = authorize Facility.find(params[:id])
    @facility.destroy

    redirect_to facilities_url
  end

  private
    def facility_params
      params.require(:facility).permit(:name, :code, :parent_id, :subset)
    end
end
