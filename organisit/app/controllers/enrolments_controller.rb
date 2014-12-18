class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]

  def index
    @enrolments = Enrolment.all
  end

  def edit
  end

  def new
    @enrolment = Enrolment.new
  end

  def update
    @enrolment.update(enrolment_params)
    redirect_to(enrolments_path)
  end

  def create
    @enrolment = Enrolment.new(enrolment_params)
    @enrolment.position = "student"
    @enrolment.save
    redirect_to(enrolments_path)
  end

  def destroy
    @enrolment.destroy
    redirect_to(enrolments_path)
  end

  private
    def set_enrolment
      @enrolment = Enrolment.find(params[:id])
    end

    def enrolment_params
      params.require(:enrolment).permit(:course_id, :user_id, :postion)
    end
end
