class BrightIdeasController < ApplicationController
  before_action :set_bright_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_people, only: [:show]
  before_action :set_like_count, only: [:index, :show, :edit, :update, :destroy]

  # GET /bright_ideas
  # GET /bright_ideas.json
  def index
    @bright_ideas = BrightIdea.all.sort {|a,b| b.likes.count <=> a.likes.count}
    @bright_idea = BrightIdea.new
    @like = Like.new
  end

  # GET /bright_ideas/1
  # GET /bright_ideas/1.json
  def show
    @people = Like.where(bright_idea_id: params[:id]).select('distinct on (user_id) *')
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
      if @bright_idea.save
        flash[:success] = "You have successfully posted a new idea!"
        redirect_to ideas_path
      else
        flash[:errors] = @bright_idea.errors.full_messages
        redirect_to :back
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

    def set_people
      @people = Like.where(bright_idea_id: params[:id])
    end

    def set_like_count
      @like_count = Like.where(bright_idea_id: params[:id]).count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bright_idea_params
      params.require(:bright_idea).permit(:idea, :user_id)
    end
end
