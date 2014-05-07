$(document).on "ready page:load", ->
  $(".playlist_play_button").on "click", (e)->
    e.preventDefault()
    $.getJSON $(this).attr("href"), (data, status, jqXHR) ->
      console.log(data)
      new Player(data)

