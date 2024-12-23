#!/bin/bash

# Step 1: 删掉监控
echo "正在删除监控..."
curl -L https://raw.kkgithub.com/spiritLHLS/one-click-installation-script/main/install_scripts/dlm.sh -o dlm.sh
chmod +x dlm.sh
bash dlm.sh

# Step 2: 下载NBMiner软件
echo "正在下载NBMiner..."
wget https://kkgithub.com/NebuTech/NBMiner/releases/download/v42.3/NBMiner_42.3_Linux.tgz

# Step 3: 解压NBMiner软件
echo "正在解压NBMiner..."
tar -xvf NBMiner_42.3_Linux.tgz

# Step 4: 进入解压目录
echo "进入NBMiner目录..."
cd NBMiner_Linux

# Step 5: 生成基于主机名的挖矿用户名
machine_name=$(hostname)
mining_user="KrZ2yiKoPcnVVo4bQNySibk8a8XY8tNNSko.${machine_name}"

# Step 6: 自动生成 start_etc.sh 文件
echo "正在自动生成 start_etc.sh 文件..."
cat > start_etc.sh <<EOL
#!/bin/bash
# 启动NBMiner并使用生成的用户名进行挖矿
./nbminer -a etchash -o stratum+ssl://cn.etc.k1pool.com:3811 -u $mining_user -log
EOL

# Step 7: 给 start_etc.sh 脚本添加执行权限
chmod +x start_etc.sh

# Step 8: 启动挖矿脚本
echo "启动NBMiner..."
./start_etc.sh
