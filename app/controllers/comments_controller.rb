class CommentsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build
  end

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(permit_params)
    @comment.user = current_user
    @comment.book_id = params[:book_id]
    if @comment.save
      flash[:notice] = "El comentario fue creado correctamente"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def permit_params
    params.require(:comment).permit!
  end
end
