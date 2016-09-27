class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
  end

  respond_to do |format|
    if @comment.save
      format.html {redirect_to @image, notice: 'Comment posted'}
      format.json {render.json: @comment, status: :created, location: @comment}
    else
      format.html {render action: "new"}
      format.json {render json: @comment.errors, status: unprocessable_entity}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :comments)
  end

end
