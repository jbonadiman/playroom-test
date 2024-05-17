extends Node2D

func _ready():
	print_debug("_ready function")

	Playroom.insert_coin({
		"avatars": [
			"https://c.tenor.com/qn8JutHbzYgAAAAC/tenor.gif",
			"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIQf73EGCJ5D2-j6Zl7X5DkxteolFopZx9VK0eGec9OOz9LaEOyJxr8tMk1bLRaG1ifLU&usqp=CAU",
			"https://i.pinimg.com/564x/9f/96/45/9f9645ad623c780eae6c5b3cdb466b05.jpg"
		],
		"maxPlayers": 2
	}, JavaScript.create_callback(EventManager, "on_lobby_created"));
