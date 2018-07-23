- if todo.errors
  ul.errors
    - todo.errors.each do |error|
      li = error.to_s

== form(action: "/todos/#{todo.id.to_s}", method: todo.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: todo.title, placeholder: "Title", class: "form-control")
  .form-group
      == label(:urgent) do
        == check_box(:urgent, checked: todo.urgent.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/todos", class: "btn btn-light btn-sm")
