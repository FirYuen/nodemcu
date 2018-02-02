function task()
    local pin = 4
    local status,temp,humi,temp_dec,humi_dec=dht.read11(pin)
    local str = string.format("温度:%d.%02d 湿度:%d.%02d", temp, temp_dec, humi, humi_dec)
    print(str)
end

tmr.create():alarm(5000, tmr.ALARM_AUTO, task)
