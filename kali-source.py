import os
import sys
import subprocess

def add_source_list(new_source):
    # 读取当前的软件源列表
    with open("/etc/apt/sources.list", "r") as f:
        sources_list = f.readlines()

    # 在软件源列表中添加新的软件源
    sources_list.append(new_source)

    # 将修改后的软件源列表写入文件
    with open("/etc/apt/sources.list", "w") as f:
        f.writelines(sources_list)

    # 更新软件包列表
    os.system("sudo apt-get update")

if __name__ == "__main__":
    new_source = "deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free"
    print(f"添加源：{new_source}")
    add_source_list(new_source)

   