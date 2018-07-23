- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/todos" ? "active" : ""
a class="nav-item #{active}" href="/todos" Todos
