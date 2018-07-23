class TodoController < ApplicationController
  def index
    todos = Todo.all
    render("index.slang")
  end

  def show
    if todo = Todo.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Todo with ID #{params["id"]} Not Found"
      redirect_to "/todos"
    end
  end

  def new
    todo = Todo.new
    render("new.slang")
  end

  def create
    todo = Todo.new(todo_params.validate!)

    if todo.valid? && todo.save
      flash["success"] = "Created Todo successfully."
      redirect_to "/todos"
    else
      flash["danger"] = "Could not create Todo!"
      render("new.slang")
    end
  end

  def edit
    if todo = Todo.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Todo with ID #{params["id"]} Not Found"
      redirect_to "/todos"
    end
  end

  def update
    if todo = Todo.find(params["id"])
      todo.set_attributes(todo_params.validate!)
      if todo.valid? && todo.save
        flash["success"] = "Updated Todo successfully."
        redirect_to "/todos"
      else
        flash["danger"] = "Could not update Todo!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Todo with ID #{params["id"]} Not Found"
      redirect_to "/todos"
    end
  end

  def destroy
    if todo = Todo.find params["id"]
      todo.destroy
    else
      flash["warning"] = "Todo with ID #{params["id"]} Not Found"
    end
    redirect_to "/todos"
  end

  def todo_params
    params.validation do
      required(:title) { |f| !f.nil? }
      required(:urgent) { |f| !f.nil? }
    end
  end
end
