defmodule MyProcess do

  @moduledoc """
    Hold the state


    iex(3)> pid = spawn(MyProcess, :awaiting_for_receive_messages, [])
    #PID<0.132.0>

    iex(4)> Process.alive?(pid)
    true

    iex(5)> send(pid, "Hi")
    Hi from me
    "Hi"
    MESSAGES RECEIVED: : ["Hi"]


    iex(6)> send(pid, "Bye")
    Bye, bye from me
    "Bye"
    MESSAGES RECEIVED: : ["Bye", "Hi"]


    iex(7)> send(pid, "Heeeey!")
    Processing something
    "Heeeey!"
    MESSAGES RECEIVED: : ["Heeeey!", "Bye", "Hi"]

  """

  def awaiting_for_receive_messages(messages_received \\ []) do
    receive do
      "Hi" = msg ->
        IO.puts "Hi from me"
        [msg|messages_received]
        |> IO.inspect(label: "MESSAGES RECEIVED: ")
        |> awaiting_for_receive_messages()

      "Bye" = msg ->
        IO.puts "Bye, bye from me"
        [msg|messages_received]
        |> IO.inspect(label: "MESSAGES RECEIVED: ")
        |> awaiting_for_receive_messages()

      msg ->
        IO.puts "Processing something"
        [msg|messages_received]
        |> IO.inspect(label: "MESSAGES RECEIVED: ")
        |> awaiting_for_receive_messages()
    end
  end
end
