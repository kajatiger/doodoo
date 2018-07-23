.row
  .col-sm-11
    h2 Todos
  .col-sm-1
    a.btn.btn-success.btn-sm href="/todos/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Urgent
        th Actions
    tbody
      - todos.each do |todo|
        tr
          td = todo.title
          td = todo.urgent
          td
            span
              == link_to("read", "/todos/#{todo.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/todos/#{todo.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/todos/#{ todo.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
