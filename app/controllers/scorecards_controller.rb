# frozen_string_literal: true

class ScorecardsController < ApplicationController
  def index
    @pagy, @scorecards = pagy(policy_scope(Scorecard.filter(filter_params).order(sort_column + " " + sort_direction).includes(:facility, :local_ngo)))
  end

  def show
    @scorecard = Scorecard.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: ::ScorecardJsonBuilder.new(@scorecard).build
      end

      format.pdf do
        render pdf: "scorecard_#{@scorecard.uuid}",
               inline: PdfTemplateInterpreter.new(@scorecard.id).interpreted_message
      end
    end
  end

  def new
    @scorecard = authorize Scorecard.new
  end

  def create
    @scorecard = authorize current_program.scorecards.new(scorecard_params)

    if @scorecard.save
      flash[:notice] = t("scorecard.create_successfully")
      redirect_to scorecard_url(@scorecard)
    else
      render :new
    end
  end

  def edit
    @scorecard = authorize Scorecard.find(params[:id])
  end

  def update
    @scorecard = authorize Scorecard.find(params[:id])

    if @scorecard.update_attributes(scorecard_params)
      redirect_to scorecards_url
    else
      render :edit
    end
  end

  def destroy
    @scorecard = authorize Scorecard.find(params[:id])
    @scorecard.destroy

    redirect_to scorecards_url
  end

  private
    def scorecard_params
      params.require(:scorecard).permit(:unit_type_id, :facility_id, :description,
        :province_id, :district_id, :commune_id, :year, :primary_school_code,
        :planned_start_date, :planned_end_date, :local_ngo_id, :scorecard_type
      ).merge({ creator_id: current_user.id })
    end

    def filter_params
      params.permit(
        :start_date, :facility_id, :uuid, :filter,
        :year, :province_id, :local_ngo_id
      ).merge(program_id: current_user.program_id)
    end
end
