# Process Lifecycle

#  creationg -> executiong -> terminating

execute_fun = fn  -> IO.puts("HI i'm the process #{inspect(self())}") end
pid = spawn(execute_fun)
Process.alive?(pid)

# Receiving Messages
