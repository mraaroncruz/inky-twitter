import Config

config :post_updates, :viewport, %{
	name: :main_viewport,
	default_scene: {PostUpdates.Scene.Main, nil},
	size: {400, 300}, # Match these to your inky display
	opts: [scale: 1.0],
	drivers: [
	  %{
		module: Scenic.Driver.Glfw
	  }
	]
}
# Add configuration that is only needed when running on the host here.
