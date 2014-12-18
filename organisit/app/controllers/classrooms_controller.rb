class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = Classroom.all
  end

  def show
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.save
    redirect_to(classrooms_path)
  end

  def update
    @classroom.update(classroom_params)
    redirect_to(classrooms_path)
  end

  def destroy
    @classroom.destroy
    redirect_to(classrooms_path)
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:name, :capacity, :city, :address)
    end
end
