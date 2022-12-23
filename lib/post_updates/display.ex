defmodule PostUpdates.Display do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, nil, opts)
  end

  @impl true
  def init(_) do
    # {:ok, pid} = Inky.start_link(:what, :red)


    {:ok, nil}
  end
end
