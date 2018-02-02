function task()
    local _,temp11,humi11=dht.read11(5)
    local _,temp22,humi22=dht.read(4)
    local str = string.format("温度:%.1f/%.1f 湿度:%.1f/%.1f", temp11, temp22, humi11, humi22)
    print(str)
end
tmr.create():alarm(5000, tmr.ALARM_AUTO, task)
