function task()
    local pin = 4
    local status,temp,humi=dht.read(pin)
    local str = string.format("当前温度:%f 湿度:%f", temp, humi)
    print(str)
end
tmr.create():alarm(5000, tmr.ALARM_AUTO, task)
