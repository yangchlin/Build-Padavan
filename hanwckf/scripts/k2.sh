#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: TurBoTse
#####################################################################

user_name="admin"                                   # 用户名
user_password="admin"                               # 登录密码
lan_ip="192.168.0"                                  # LAN 地址 别写后面的 .1
wlan_2g_ssid="Padavan"                              # 2G 无线名称
wlan_5g_ssid="Padavan_5G"                           # 5G 无线名称
wlan_guest_2g_ssid="Padavan_Guset"                  # 2G 访客无线名称
wlan_guest_5g_ssid="Padavan_Guest_5G"               # 5G 访客无线名称
wlan_2g_psk="1234567890"                            # 2G WIFI密码最少8位 空白为不设置
wlan_5g_psk="1234567890"                            # 5G WIFI密码最少8位 空白为不设置
version_time=$(date +%Y%m%d)                        # 更新时版本号时间: 20210101
default_path="./user/shared"                        # 默认配置路径
default_file="./configs/templates/PSG1218.config"   # 默认配置文件

echo "修改用户名"
sed -i 's/SYS_USER_ROOT		"admin"/SYS_USER_ROOT		"'$user_name'"/g' $default_file

echo "修改登陆密码"
sed -i 's/DEF_ROOT_PASSWORD	"admin"/DEF_ROOT_PASSWORD	"'$user_password'"/g' $default_file

echo "修改 LAN IP 地址"
sed -i "s/192.168.2/$lan_ip/g" $default_path/defaults.h

echo "修改 2G 无线名称"
sed -i 's/DEF_WLAN_2G_SSID	BOARD_PID "_%s"/DEF_WLAN_2G_SSID	"'$wlan_2g_ssid'"/g' $default_file

echo "修改 5G 无线名称"
sed -i 's/DEF_WLAN_5G_SSID	BOARD_PID "_5G_%s"/DEF_WLAN_5G_SSID	"'$wlan_5g_ssid'"/g' $default_file

echo "修改 2G 访客无线名称"
sed -i 's/DEF_WLAN_2G_GSSID	BOARD_PID "_GUEST_%s"/DEF_WLAN_2G_GSSID	"'$wlan_guest_2g_ssid'"/g' $default_file

echo "修改 5G 访客无线名称"
sed -i 's/DEF_WLAN_5G_GSSID	BOARD_PID "_GUEST_5G_%s"/DEF_WLAN_5G_GSSID	"'$wlan_guest_5g_ssid'"/g' $default_file

echo "修改 2.4GHz WIFI 密码"
sed -i 's/DEF_WLAN_2G_PSK		"1234567890"/DEF_WLAN_2G_PSK		"'$wlan_2g_psk'"/g' $default_file

echo "修改 5GHz WIFI 密码"
sed -i 's/DEF_WLAN_5G_PSK		"1234567890"/DEF_WLAN_5G_PSK		"'$wlan_5g_psk'"/g' $default_file

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc

#echo "设置为PPPOE模式并写入账号和密码"
#sed -i 's/{ "wan_proto", "dhcp" }/{ "wan_proto", "pppoe" }/g' $default_path/defaults.c
#sed -i 's/{ "wan_pppoe_username", "" }/{ "wan_pppoe_username", "你的宽带账号" }/g' $default_path/defaults.c
#sed -i 's/{ "wan_pppoe_passwd", "" }/{ "wan_pppoe_passwd", "宽带密码" }/g' $default_path/defaults.c

#echo "设置为AP模式"
#echo "#define BOARD_ROLE_REPEATER	1" >> ./configs/boards/K2P/board.h

#echo "打开2G无线桥接"
#sed -i 's/{ "rt_mode_x", "0" }/{ "rt_mode_x", "4" }/g' $default_path/defaults.c

#echo "打开5G无线桥接"
#sed -i 's/{ "wl_mode_x", "0" }/{ "wl_mode_x", "4" }/g' $default_path/defaults.c

#echo "超频到 900MHz "
#sed -i '/CONFIG_FIRMWARE_CPU_900MHZ/d' $config
#echo "CONFIG_FIRMWARE_CPU_900MHZ=y" >> $config

#echo "集成 KMS 激活服务器"
#sed -i "s/CONFIG_FIRMWARE_INCLUDE_VLMCSD=n/CONFIG_FIRMWARE_INCLUDE_VLMCSD=y/g" $config