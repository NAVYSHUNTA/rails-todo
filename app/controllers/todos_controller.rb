class TodosController < ApplicationController
  def index
    if params[:status].present?
      @todos = Todo.where(status: Todo.statuses[params[:status]])
    else
      @todos = Todo.all
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new(params[:status])
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo }
        format.json { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy!
    redirect_to todos_path(status: session[:status])
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :priority, :deadline, :status)
  end
end
