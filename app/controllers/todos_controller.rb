class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      respond_to do |format|
        format.json { head :ok }
        format.html { redirect_to @todo }
      end
    else
      respond_to do |format|
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.html { render :edit }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy!
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :priority, :done, :deadline)
  end
end
