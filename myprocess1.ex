defmodule MyProcess do
  @moduledoc """
    Receiving messages in a process

    pid = spawn(MyProcess, :awaiting_for_receive_messages, [])
    #PID<0.129.0>

    Process.alive? pid
    true

    send pid, "Hi"
    Hi for me
    Process #PID<0.129.0>, message processed. Terminating...
  """

  def awaiting_for_receive_messages do
    receive do
      "Hi" -> IO.puts "Hi for me"
      "Bye" -> IO.puts "Bye, bye for me"
      _ ->  IO.puts "Processing something"
    end

    IO.puts "Process #{inspect(self())}, message processed. Terminating..."
  end
end
