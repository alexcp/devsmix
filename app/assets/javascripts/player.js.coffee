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
      $(".playlist_play_button").removeClass("disabled")
      $(".playlist_play_button").val("Play")
    ,onError: ()->
      console.log(message)

  load: () ->
    config = @config()
    $("#music_player").player(config)
