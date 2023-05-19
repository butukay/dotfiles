function os.capture(cmd)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))

    f:close()

    return s
end

local json = require('cjson')

local w = json.decode(
    os.capture("yabai -m query --windows --window")
)

local d = json.decode(
    os.capture("yabai -m query --displays --window")
)

new_x = (d['frame']['x'] + (d['frame']['w'] / 2)) - (w['frame']['w'] / 2)
new_y = (d['frame']['y'] + (d['frame']['h'] / 2)) - (w['frame']['h'] / 2)

os.capture(
    string.format("yabai -m window %d --move abs:%f:%f", w['id'], new_x, new_y)
)
