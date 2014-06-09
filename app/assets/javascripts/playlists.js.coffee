$(document).on "ready page:load", ->
  $(".playlist_play_button").on "click", (e)->
    $(this).val("Loading..")
    $(this).addClass("disabled")
    $.getJSON $(this).attr("href"), (data, status, jqXHR) ->
      if status == "success"
        new Player(data)
    e.preventDefault()
