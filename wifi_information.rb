
initial_wifi_info = `su -c dumpsys wifi | grep "mWifiInfo"`
flag = initial_wifi_info && !initial_wifi_info.include?("SSID: <unknown ssid>") ? 1 : 0
oldSSID = ""

while true
  wifi_info = `su -c dumpsys wifi | grep "mWifiInfo"`

  if wifi_info.nil? || wifi_info.strip.empty?
    puts "WiFi bilgisi alınamadı."
  else
    if wifi_info.include?("SSID: <unknown ssid>")
      puts "WiFi ağına bağlı değilsiniz."
      if flag == 1
        `termux-tts-speak -r 1.3 -l tr -n TR "WiFi bağlantısı koptu."`
        flag = 0
      end
    else
      match_data = wifi_info.match(/SSID: (.*?),/)
      if match_data
        ssid = match_data[1]
        if flag == 0 || oldSSID != ssid
          puts `termux-tts-speak -r 1.3 -l tr -n TR "#{ssid} ağına bağlanıldı."`
          oldSSID = ssid
          flag = 1
        end
      end
    end
  end
  sleep(1)
end
