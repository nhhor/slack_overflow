class QuestionsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:alert] = 'The record you tried to access no longer exists.'
  #   render :sorry   # or e.g. redirect_to :action => :index
  # end

  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully created!"
      redirect_to questions_path
    else
      flash[:alert] = "There was a problem creating this question!"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def update
    @question= Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to questions_path
    else
      flash[:alert] = "There was a problem updating this question!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Question successfully removed!"

    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :question, :user_id)
    end

end
