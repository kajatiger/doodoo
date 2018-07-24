- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Welcome
- active = context.request.path == "/todos" ? "active" : ""
a class="nav-item #{active}" href="/todos" Todos
