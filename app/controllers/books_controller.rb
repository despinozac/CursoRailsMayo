class BooksController < ApplicationController

  before_action :read?, only: :read
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

    @read = @book.read_by_user?(current_user)
  end

  def new
    @book = Book.new
  end

  def create
    if Book.create(permit_params)
      flash[:notice] = "El Book se ha creado con exito"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(permit_params)
      flash[:notice] = "El book se ha actualizado correctamente"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "El book se ha borrado correctamente"
      redirect_to books_path
    end
  end

  def read
    book = Book.find(params[:id])
    
    book.users << current_user

    redirect_to book_path(book), notice: "Enhorabuena, ya habeís leido el libro."
  end

  private

  def permit_params
    params.require(:book).permit!
  end

  def read?
    book = Book.find(params[:id])

    if book.read_by_user?(current_user)
      redirect_to book_path(book), notice: "Ya habeís leido el libro."
    end
  end
end
