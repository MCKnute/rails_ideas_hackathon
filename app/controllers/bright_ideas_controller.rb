class BrightIdeasController < ApplicationController
  before_action :set_bright_idea, only: [:show, :edit, :update, :destroy]

  # GET /bright_ideas
  # GET /bright_ideas.json
  def index
    @bright_ideas = BrightIdea.all
  end

  # GET /bright_ideas/1
  # GET /bright_ideas/1.json
  def show
  end

  # GET /bright_ideas/new
  def new
    @bright_idea = BrightIdea.new
  end

  # GET /bright_ideas/1/edit
  def edit
  end

  # POST /bright_ideas
  # POST /bright_ideas.json
  def create
    @bright_idea = BrightIdea.new(bright_idea_params)

    respond_to do |format|
      if @bright_idea.save
        format.html { redirect_to @bright_idea, notice: 'Bright idea was successfully created.' }
        format.json { render :show, status: :created, location: @bright_idea }
      else
        format.html { render :new }
        format.json { render json: @bright_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bright_ideas/1
  # PATCH/PUT /bright_ideas/1.json
  def update
    respond_to do |format|
      if @bright_idea.update(bright_idea_params)
        format.html { redirect_to @bright_idea, notice: 'Bright idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @bright_idea }
      else
        format.html { render :edit }
        format.json { render json: @bright_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bright_ideas/1
  # DELETE /bright_ideas/1.json
  def destroy
    @bright_idea.destroy
    respond_to do |format|
      format.html { redirect_to bright_ideas_url, notice: 'Bright idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bright_idea
      @bright_idea = BrightIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bright_idea_params
      params.require(:bright_idea).permit(:idea)
    end
end
