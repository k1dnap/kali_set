import subprocess

# 打开文件
file_path = "/etc/apt/sources.list"
subprocess.run(["vim", file_path])

# 读取文件内容
with open(file_path, "r") as file:
    content = file.read()
    print(content)

# 修改文件内容
new_content = "deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free"
with open(file_path, "w") as file:
    file.write(new_content)