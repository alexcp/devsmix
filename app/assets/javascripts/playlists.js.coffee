$(document).on "ready page:load", ->
  $(".playlist_play_button").on "click", (e)->
    $("#music_player").player("playVideo")
    e.preventDefault()

  loadVideo = ()->
    $.getJSON window.location.pathname, (data, status, jqXHR) ->
      if status == "success"
        new Player(data)

  if window.location.pathname.match("playlists")
    $("#music_player").show()
    loadVideo()
  else
    $("#music_player").hide()
