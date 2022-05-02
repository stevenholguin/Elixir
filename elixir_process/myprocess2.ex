 defmodule MyProcess do
  @moduledoc """
    Keeping the process alive

    pid = spawn(MyProcess, :awaiting_for_receive_messages, [])
    Process #PID<0.127.0>, waiting to process a message!
    #PID<0.127.0>


    iex(4)> Process.alive?(pid)
    true


    iex(5)> send(pid, "Hi")
    Hi from me
    Process #PID<0.127.0>, waiting to process a message!
    "Hi"

    iex(6)> Process.alive?(pid)
    true


  """
   def awaiting_for_receive_messages do
     IO.puts "Process #{inspect(self())}, waiting to process a message!"
     receive do
       "Hi" ->
         IO.puts "Hi from me"
       "Bye" ->
         IO.puts "Bye, bye from me"
       _ ->
         IO.puts "Processing something"
     end
     awaiting_for_receive_messages()
   end
end
