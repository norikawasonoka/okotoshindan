# frozen_string_literal: true

# Represents the controller for Diagnoses.
class DiagnosesController < ApplicationController
  skip_before_action :require_login
  def index
    @diagnosis = Diagnosis.all
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    # params[:topic][:question] ? @topic.question = params[:topic][:question].join("") : false
    if @diagnosis.save
      flash[:notice] = '診断が完了しました'
      redirect_to diagnosis_path(@diagnosis.id)
    else
      redirect_to action: 'new'
    end
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:title)
  end
end
