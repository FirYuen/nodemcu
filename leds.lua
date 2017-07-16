local r, g, b = 0, 0, 0
local _r, _g, _b = 0, 0, 0
local tick, _tick = 0
local pinR, pinG, pinB = 1, 2, 3
local MAX = 1023

function led(r,g,b)
--    print("led", r, g, b)
    pwm.setduty(pinR,r)
    pwm.setduty(pinG,g)
    pwm.setduty(pinB,b)
end

function nextColor()
    _r, _g, _b = r, g, b
    r = math.random(0, 5) * MAX / 5
    g = math.random(0, 5) * MAX / 5
    b = math.random(0, 5) * MAX / 5
    tick = 10--math.random(10, 20)
    _tick = tick
end

function update()
    if(tick <= 0) then
        nextColor()
    end
    local percent = (_tick - tick) / _tick
    local rr = _r + (r - _r) * percent
    local gg = _g + (g - _g) * percent
    local bb = _b + (b - _b) * percent
    led(rr, gg, bb, percent)
    tick = tick - 1
end

pwm.setup(pinR,500,MAX)
pwm.setup(pinG,500,MAX)
pwm.setup(pinB,500,MAX)
tmr.alarm(1,100,1,update)