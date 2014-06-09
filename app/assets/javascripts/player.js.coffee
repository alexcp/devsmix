class @Player
  constructor: (playlist) ->
    @playlist = playlist
    @load()

  config: ()->
    playlistBuilder: (videos)->
      list = $("<ul class='list-group'></ul>")
      for video in videos
        $("<li class='list-group-item'>#{video.title}</li>")
          .data('video', video)
          .attr('title', video.title)
          .appendTo(list)
      return {container: $("#custom_playlist"), items: list.appendTo("#custom_playlist").find("li")}
    ,playlistBuilderClickHandler: (event)->
      event.preventDefault()
    ,playlist: @playlist,
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
