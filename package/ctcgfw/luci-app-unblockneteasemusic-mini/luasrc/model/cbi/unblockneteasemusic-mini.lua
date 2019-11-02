-- Created By [CTCGFW]Project-OpenWrt
-- https://github.com/project-openwrt

mp = Map("unblockneteasemusic-mini", translate("解除网易云音乐播放限制"))
mp.description = translate("原理：采用 [QQ/虾米/百度/酷狗/酷我/咕咪/JOOX] 等音源，替换网易云音乐 无版权/收费 歌曲链接<br/>由 [CTCGFW]Project-OpenWrt 提供服务器支持，来源: https://github.com/project-openwrt/luci-app-unblockneteasemusic-mini")

mp:section(SimpleSection).template = "unblockneteasemusic-mini/unblockneteasemusic_mini_status"

s = mp:section(TypedSection, "unblockneteasemusic-mini")
s.anonymous=true
s.addremove=false

enable = s:option(Flag, "enable", translate("启用本插件"))
enable.description = translate("启用本插件以解除网易云音乐播放限制")
enable.default = 0
enable.rmempty = false

download_certificate=s:option(DummyValue,"opennewwindow",translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"下载CA根证书\" onclick=\"window.open('https://raw.githubusercontent.com/nondanee/UnblockNeteaseMusic/master/ca.crt')\" />"))
download_certificate.description = translate("Linux/iOS/MacOSX设备在信任根证书后方可正常使用解锁功能。")

return mp
