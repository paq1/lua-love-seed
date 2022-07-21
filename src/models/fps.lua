local Fps = {}

function Fps:default()
    return Fps:new(0, 0, 0)
end

function Fps:new(timer, frames, value)
    return {
        timer = timer,
        frames = frames,
        value = value
    }
end

function Fps:update(dt, fps)
    local new_timer = fps.timer + dt
    local new_frames = fps.frames + 1

    if new_timer > 1.0 then
        return Fps:new(0, 0, new_frames)
    else
        return Fps:new(new_timer, new_frames, fps.value)
    end
end

return Fps