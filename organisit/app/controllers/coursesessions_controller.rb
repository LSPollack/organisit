class CoursesessionsController < ApplicationController
  before_action :set_coursesession, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @coursesessions = Coursesession.all
    respond_with(@coursesessions)
  end

  def show
    respond_with(@coursesession)
  end

  def new
    @coursesession = Coursesession.new
    respond_with(@coursesession)
  end

  def edit
  end

  def create
    @coursesession = Coursesession.new(coursesession_params)
    @coursesession.save
    respond_with(@coursesession)
  end

  def update
    @coursesession.update(coursesession_params)
    respond_with(@coursesession)
  end

  def destroy
    @coursesession.destroy
    respond_with(@coursesession)
  end

  private
    def set_coursesession
      @coursesession = Coursesession.find(params[:id])
    end

    def coursesession_params
      params.require(:coursesession).permit(:timeofday)
    end
end
