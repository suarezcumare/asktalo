class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show, :recent_question ]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order(:created_at)
    @myquestions = Question.mine
    question_recent
  end

  def recent_question
    @questions= Question.recent
    @myquestions = Question.mine

    question_recent

    render "questions/index"
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
      @question.addView
      @answer = Answer.new
  end

  # GET /questions/new
  def new
    @label = Label.new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @label = Label.new
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      value = params.require(:question).permit(:description, label_ids: [])
    end

    def question_recent
      @questionslasts = Question.recent
      @questionslastsmine = Question.mine.recent_min
      @myquestionscolaborations = Answer.mine.recent
    end
end
