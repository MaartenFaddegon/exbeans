defmodule Players.Supervisor do
  @moduledoc false
  
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def new_player(name) do
    Supervisor.start_child(__MODULE__, [name])
  end

  def init([]) do
    children = [
      worker(Player, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end