defmodule PostUpdates.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PostUpdates.Supervisor]

    children = children(:shared) ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    []
  end

  def children(:shared) do
    [
      PostUpdates.Display,
      {Scenic, viewports: [viewport_config()]}
    ]
  end

  def children(_) do
    [
      PostUpdates.WifiChecker
    ]
  end

  def viewport_config do
    Application.get_env(:post_updates, :viewport)
  end

  def target() do
    Application.get_env(:post_updates, :target)
  end
end
