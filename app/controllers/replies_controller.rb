class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies or /replies.json
  def create
    @post = Post.find(params[:post_id])
    parent_id = params[:reply][:parent_id]
    @reply = @post.replies.new(reply_params)
    @reply.user = current_user

    if parent_id.present?
      parent = Reply.find_by(id: parent_id)
      if parent && parent.post_id == @post.id
        @reply.parent_id = parent_id
      end
    end

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply.destroy!

    respond_to do |format|
      format.html { redirect_to replies_path, status: :see_other, notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.expect(reply: [ :content, :user_id ])
    end
end
