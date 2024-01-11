import os
import sys
import subprocess

# 设置pip源为清华源
pip_config_path = os.path.expanduser("~/.pip/pip.conf")
if not os.path.exists(os.path.dirname(pip_config_path)):
    os.makedirs(os.path.dirname(pip_config_path))
with open(pip_config_path, "w") as f:
    f.write("[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple")

# 更新pip包列表
subprocess.run([sys.executable, "-m", "pip", "install", "--upgrade", "pip"])