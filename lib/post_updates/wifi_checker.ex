defmodule PostUpdates.WifiChecker do
  use GenServer

  def start_link(_init_args) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def init(_args) do
    Process.send_after(self(), :check_status, 10_000, [])
    {:ok, nil}
  end

  @impl true
  def handle_info(:check_status, state) do
    unless connected?() do
      VintageNetWizard.run_wizard()
    end

    {:noreply, state}
  end

  def connected? do
    Req.new(url: "https://google.com")
    |> Req.request()
    |> case do
      {:error, _} -> false
      _ -> true
    end
  end
end
