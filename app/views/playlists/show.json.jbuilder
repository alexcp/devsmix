json.title @playlist.name

json.videos @playlist.songs.map do |song|
  json.title song.title
  json.id song.youtube_id
end
