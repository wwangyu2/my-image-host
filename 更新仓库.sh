 #!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 将所有修改过的文件添加到 Git 仓库
git add -A

# 提交这些更改，并附上一条提交信息
git commit -m "添加图片"

# 将提交推送到 GitHub
git push origin main