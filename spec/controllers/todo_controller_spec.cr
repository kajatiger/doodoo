require "./spec_helper"

def todo_hash
  {"title" => "Fake", "urgent" => "true"}
end

def todo_params
  params = [] of String
  params << "title=#{todo_hash["title"]}"
  params << "urgent=#{todo_hash["urgent"]}"
  params.join("&")
end

def create_todo
  model = Todo.new(todo_hash)
  model.save
  model
end

class TodoControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe TodoControllerTest do
  subject = TodoControllerTest.new

  it "renders todo index template" do
    Todo.clear
    response = subject.get "/todos"

    response.status_code.should eq(200)
    response.body.should contain("todos")
  end

  it "renders todo show template" do
    Todo.clear
    model = create_todo
    location = "/todos/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Todo")
  end

  it "renders todo new template" do
    Todo.clear
    location = "/todos/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Todo")
  end

  it "renders todo edit template" do
    Todo.clear
    model = create_todo
    location = "/todos/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Todo")
  end

  it "creates a todo" do
    Todo.clear
    response = subject.post "/todos", body: todo_params

    response.headers["Location"].should eq "/todos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a todo" do
    Todo.clear
    model = create_todo
    response = subject.patch "/todos/#{model.id}", body: todo_params

    response.headers["Location"].should eq "/todos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a todo" do
    Todo.clear
    model = create_todo
    response = subject.delete "/todos/#{model.id}"

    response.headers["Location"].should eq "/todos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
