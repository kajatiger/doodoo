require "./spec_helper"
require "../../src/models/todo.cr"

describe Todo do
  Spec.before_each do
    Todo.clear
  end
end
