h1 Show Todo
p = todo.title
p = todo.urgent
p
  == link_to("back", "/todos", class: "btn btn-light btn-sm")
  == link_to("edit", "/todos/#{todo.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/todos/#{todo.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
