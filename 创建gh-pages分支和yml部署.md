为了在本地设置一个GitHub Actions Workflow，自动地将更改从`main`分支同步到`gh-pages`分支，并使用`echo`命令在Windows环境中创建workflow文件，以及使用最新版本的`actions/checkout`，请按照以下步骤操作：

### 步骤1：创建`gh-pages`分支

如果您还没有`gh-pages`分支，首先在本地创建并推送到GitHub：

```sh
git checkout -b gh-pages
git push -u origin gh-pages
```

这将创建`gh-pages`分支并设置远程跟踪。

### 步骤2：返回到`main`分支

确保您在`main`分支上进行后续操作：

```sh
git checkout main
```

### 步骤3：创建GitHub Actions Workflow文件

首先，创建必要的目录结构：

```cmd
mkdir .github\workflows
```

然后，使用`echo`命令创建Workflow文件。这里我们将直接创建文件，稍后再编辑它：

```cmd
echo.>.github\workflows\sync-branches.yml
```

### 步骤4：编辑Workflow文件

打开`.github\workflows\sync-branches.yml`文件进行编辑。您可以使用任何文本编辑器，如Notepad++、VSCode等。将以下内容粘贴到文件中(只要更改一下邮箱和用户名就行)：

```yaml
name: Sync gh-pages with main branch

on:
  push:
    branches:
      - main

jobs:
  sync-gh-pages:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4
    - name: Set up Git config
      run: |
        git config --global user.email "you@example.com"
        git config --global user.name "Your GitHub Username"
    - name: Push changes to gh-pages
      run: |
        git fetch --all
        git checkout gh-pages || git checkout -b gh-pages
        git merge main --allow-unrelated-histories -m "Merge main to gh-pages"
        git push origin gh-pages
```

确保替换`you@example.com`和`Your GitHub Username`为您自己的信息。

### 步骤5：提交并推送Workflow文件

提交您的更改，并将它们推送到GitHub：

```sh
git add .github\workflows\sync-branches.yml
git commit -m "Add GitHub Actions workflow to sync branches"
git push origin main
```

完成以上步骤后，每次您向`main`分支推送更新时，GitHub Actions就会自动触发此workflow，同步更改到`gh-pages`分支。这样，您的GitHub Pages站点将自动更新以反映`main`分支的最新内容。
<br>
<br>
<br>

### 步骤4-1：编辑Workflow文件
- 更新过的：
```yaml
name: Sync gh-pages with main branch

on:
  push:
    branches:
      - main

jobs:
  sync-gh-pages:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4
    - name: Deploy 🚀
      uses: JamesIves/github-pages-deploy-action@4.1.5
      with:
        branch: gh-pages # 指定了部署目标分支，即 GitHub Actions 将会把内容部署到 gh-pages 分支。
        folder: . # 指定了源文件夹，即 GitHub Actions 将会从你的仓库中的 public 文件夹获取内容进行部署。
```
<br>
<br>

`uses: JamesIves/github-pages-deploy-action@4.1.5`相当于  
```   
- name: Set up Git config
  run: |
    git config --global user.email "you@example.com"
    git config --global user.name "Your GitHub Username"
- name: Push changes to gh-pages
  run: |
    git fetch --all
    git checkout gh-pages || git checkout -b gh-pages
    git merge main --allow-unrelated-histories -m "Merge main to gh-pages"
    git push origin gh-pages
```