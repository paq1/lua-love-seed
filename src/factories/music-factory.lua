local MusicFactory = {}

MusicFactory.music_menu = nil

function MusicFactory.playMusicMenu()
    local source = MusicFactory.getMusicMenu()
    if not source:isPlaying() then
        love.audio.play(source)
    end
end

function MusicFactory.stopMusicMenu()
    local source = MusicFactory.getMusicMenu()
    if source:isPlaying() then
        love.audio.stop(source)
    end
end

function MusicFactory.getMusicMenu()
    if MusicFactory.music_menu == nil then
        MusicFactory.music_menu = love.audio.newSource("assets/musics/menu.mp3", "stream")
    end
    return MusicFactory.music_menu;
end

return MusicFactory