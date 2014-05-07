class @Player
  constructor: (playlist) ->
    @playlist = playlist
    @load()

  config: ()->
    playlist: @playlist,
    autoPlay: true,
    autoStart: true,
    height: 0,
    onReady: ()->
      console.log("playlist has loaded")
    ,onError: ()->
      console.log(message)

  load: () ->
    config = @config()
    $("#music_player").player(config)
