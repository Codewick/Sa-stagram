class CommentsController < ApplicationController
  before_action :set_photo, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json

  def index
    # @photo is defined in the set_photo method (i.e. before_action)
    @comments = Comment.all
    @new_comment = Comment.new

    puts "@photo is: #{@photo.inspect}"
    puts "@comments is: #{@comments.inspect}"

    # activerecord provides .all method
  end

  def show
  end

   # GET /comments/1/edit
   def edit
   end

  def create
    puts "comment_params is: #{comment_params}"
    puts "current_user is: #{current_user}"
    puts "params is: #{params}"

    @comments = Comment.all
    @new_comment = Comment.new(comment_params)
    @new_comment.user = current_user
    @photo = params[:photo_id]
    @new_comment.photo_id = @photo

    puts "@photo is: #{@photo}"
    puts "@new_comment is: #{@new_comment.inspect}"
    puts "photo_comments_url is: #{photo_comments_url}"
    puts "photo_comments_path is: #{photo_comments_path}"

    respond_to do |format|
       if @new_comment.save
         format.html { redirect_to photo_comments_url(@photo), notice: 'Comment was successfully created.' }
         format.json { render :show, status: :created, location: @new_comment }
       else # Validation errors
         format.html { render :index }
         format.json { render json: @new_comment.errors, status: :unprocessable_entity }
       end
     end
  end


  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def comment_params
     params.require(:comment).permit(:photo_id, :user_id, :content)
  end
end
