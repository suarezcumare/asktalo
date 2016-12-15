class QuestionLabelsController < ApplicationController
  before_action :set_question_label, only: [:show, :edit, :update, :destroy]

  # GET /question_labels
  # GET /question_labels.json
  def index
    @question_labels = QuestionLabel.all
  end

  # GET /question_labels/1
  # GET /question_labels/1.json
  def show
  end

  # GET /question_labels/new
  def new
    @question_label = QuestionLabel.new
  end

  # GET /question_labels/1/edit
  def edit
  end

  # POST /question_labels
  # POST /question_labels.json
  def create
    @question_label = QuestionLabel.new(question_label_params)

    respond_to do |format|
      if @question_label.save
        format.html { redirect_to @question_label, notice: 'Question label was successfully created.' }
        format.json { render :show, status: :created, location: @question_label }
      else
        format.html { render :new }
        format.json { render json: @question_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_labels/1
  # PATCH/PUT /question_labels/1.json
  def update
    respond_to do |format|
      if @question_label.update(question_label_params)
        format.html { redirect_to @question_label, notice: 'Question label was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_label }
      else
        format.html { render :edit }
        format.json { render json: @question_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_labels/1
  # DELETE /question_labels/1.json
  def destroy
    @question_label.destroy
    respond_to do |format|
      format.html { redirect_to question_labels_url, notice: 'Question label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_label
      @question_label = QuestionLabel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_label_params
      params.require(:question_label).permit(:question_id, :label_id)
    end
end
