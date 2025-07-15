class SubforumsController < ApplicationController
  before_action :set_subforum, only: %i[ show edit update destroy ]

  # GET /subforums or /subforums.json
  def index
    @subforums = Subforum.all
  end

  # GET /subforums/1 or /subforums/1.json
  def show
  end

  # GET /subforums/new
  def new
    @subforum = Subforum.new
  end

  # GET /subforums/1/edit
  def edit
  end

  # POST /subforums or /subforums.json
  def create
    @subforum = Subforum.new(subforum_params)

    respond_to do |format|
      if @subforum.save
        format.html { redirect_to @subforum, notice: "Subforum was successfully created." }
        format.json { render :show, status: :created, location: @subforum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subforum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subforums/1 or /subforums/1.json
  def update
    respond_to do |format|
      if @subforum.update(subforum_params)
        format.html { redirect_to @subforum, notice: "Subforum was successfully updated." }
        format.json { render :show, status: :ok, location: @subforum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subforum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subforums/1 or /subforums/1.json
  def destroy
    @subforum.destroy!

    respond_to do |format|
      format.html { redirect_to subforums_path, status: :see_other, notice: "Subforum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subforum
      @subforum = Subforum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def subforum_params
      params.expect(subforum: [ :title, :description, :tag_list ])
    end
end
