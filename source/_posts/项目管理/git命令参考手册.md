---
title: git命令参考手册
date: 2016-06-26 21:53:56
tags: git
categories: 项目管理
---
### 文档###

- [Pro Git（中文版）](https://git.oschina.net/progit/index.html)

- [廖雪峰的官方文档](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)


- [git参考手册](http://gitref.org/zh/)


### 总结版本###

```cpp
git init                    # 初始化本地git仓库（创建新仓库）
git config --global user.name "xxx"          # 配置用户名
git config --global user.email "xxx@xxx.com"         # 配置邮件
git config --global color.ui true       # git status等命令自动着色
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
git clone git+ssh://git@192.168.53.168/VT.git    # clone远程仓库
git status              # 查看当前版本状态（是否修改）
git add xyz             # 添加xyz文件至index
git add .           # 增加当前子目录下所有更改过的文件至index
git commit -m 'xxx'                 # 提交
git commit --amend -m 'xxx'      # 合并上一次提交（用于反复修改）
git commit -am 'xxx'             # 将add和commit合为一步
git rm xxx                      # 删除index中的文件
git rm -r *                 # 递归删除
git log                       # 显示提交日志
git log -1                      # 显示1行日志 -n为n行
git log -5
git log --stat        # 显示提交日志及相关变动文件
git log -p -m
git show dfb02e6e4f2f7b573337763e5c0013802e392818  # 显示某个提交的详细内容
git show dfb02          # 可只用commitid的前几位
git show HEAD               # 显示HEAD提交日志
git show HEAD^     # 显示HEAD的父（上一个版本）的提交日志 ^^为上两个版本 ^5为上5个版本
git tag                   # 显示已存在的tag
git tag -a v2.0 -m 'xxx'            # 增加v2.0的tag
git show v2.0         # 显示v2.0的日志及详细内容
git log v2.0                # 显示v2.0的日志
git diff              # 显示所有未添加至index的变更
git diff --cached      # 显示所有已添加index但还未commit的变更
git diff HEAD^     # 比较与上一个版本的差异
git diff HEAD -- ./lib       # 比较与HEAD版本lib目录的差异
git diff origin/master..master      # 比较远程分支master上有本地分支master上没有的
git diff origin/master..master --stat        # 只显示差异的文件，不显示具体内容
git remote add origin git+ssh://git@192.168.53.168/VT.git # 增加远程定义（用于push/pull/fetch）
git branch                 # 显示本地分支
git branch --contains 50089        # 显示包含提交50089的分支
git branch -a                    # 显示所有分支
git branch -r         # 显示所有原创分支
git branch --merged          # 显示所有已合并到当前分支的分支
git branch --no-merged          # 显示所有未合并到当前分支的分支
git branch -m master master_copy       # 本地分支改名
git checkout -b master_copy            # 从当前分支创建新分支master_copy并检出
git checkout -b master master_copy     # 上面的完整版
git checkout features/performance      # 检出已存在的features/performance分支
git checkout --track hotfixes/BJVEP933       # 检出远程分支hotfixes/BJVEP933并创建本地跟踪分支
git checkout v2.0            # 检出版本v2.0
git checkout -b devel origin/develop                      # 从远程分支develop创建新本地分支devel并检出
git checkout -- README            # 检出head版本的README文件（可用于修改错误回退）
git merge origin/master      # 合并远程master分支至当前分支
git cherry-pick ff44785404a8e    # 合并提交ff44785404a8e的修改
git push origin master        # 将当前分支push到远程master分支
git push origin :hotfixes/BJVEP933           # 删除远程仓库的hotfixes/BJVEP933分支
git push --tags            # 把所有tag推送到远程仓库
git fetch               # 获取所有远程分支（不更新本地分支，另需merge）
git fetch --prune              # 获取所有原创分支并清除服务器上已删掉的分支
git pull origin master          # 获取远程分支master并merge到当前分支
git mv README README2      # 重命名文件README为README2
git reset --hard HEAD      # 将当前版本重置为HEAD（通常用于merge失败回退）
git rebase
git branch -d hotfixes/BJVEP933        # 删除分支hotfixes/BJVEP933（本分支修改已合并到其他分支）
git branch -D hotfixes/BJVEP933    # 强制删除分支hotfixes/BJVEP933
git ls-files          # 列出git index包含的文件
git show-branch        # 图示当前分支历史
git show-branch --all         # 图示所有分支历史
git whatchanged           # 显示提交历史对应的文件修改
git revert dfb02e6e4f2f7b573337763e5c0013802e392818       # 撤销提交dfb02e6e4f2f7b573337763e5c0013802e392818
git ls-tree HEAD           # 内部命令：显示某个git对象
git rev-parse v2.0       # 内部命令：显示某个ref对于的SHA1 HASH
git reflog         # 显示所有提交，包括孤立节点
git show HEAD@{5}
git show master@{yesterday}      # 显示master分支昨天的状态
git log --pretty=format:'%h %s' --graph        # 图示提交日志
git show HEAD~3
git show -s --pretty=raw 2be7fcb476
git stash     # 暂存当前修改，将所有至为HEAD状态
git stash list         # 查看所有暂存
git stash show -p stash@{0}    # 参考第一次暂存
git stash apply stash@{0}       # 应用第一次暂存
git grep "delete from"    # 文件中搜索文本“delete from”
git grep -e '#define' --and -e SORT_DIRENT
git gc
git fsck
```

### Git配置###

- 用户的git配置文件~/.gitconfig


```cpp
git init                    #初始化本地git仓库（创建新仓库）
git config --global user.name "xxx"     #配置用户名
git config --global user.email "xxx@xxx.com"   # 配置邮件
git config --global color.ui true    # git status等命令自动着色
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global core.editor "mate -w"    # 设置Editor使用textmate
git config -l  # 列举所有配置
```

<!-- more -->

### Git常用命令###
#### 查看、添加、提交、删除、找回，重置修改文件####

```cpp
git help <command>  # 显示command的help
git show            # 显示某次提交的内容
git show $id

git co  -- <file>   # 抛弃工作区修改
git co  .           # 抛弃工作区修改

git add <file>      # 将工作文件修改提交到本地暂存区
git add .           # 将所有修改过的工作文件提交暂存区

git rm <file>       # 从版本库中删除文件
git rm <file> --cached  # 从版本库中删除文件，但不删除文件

git reset <file>    # 从暂存区恢复到工作文件
git reset -- .      # 从暂存区恢复到工作文件
git reset --hard    # 恢复最近一次提交过的状态，即放弃上次提交后的所有本次修改

git ci <file>
git ci .
git ci -a           # 将git add, git rm和git ci等操作都合并在一起做
git ci -am "some comments"
git ci --amend      # 修改最后一次提交记录

git revert <$id>    # 恢复某次提交的状态，恢复动作本身也创建了一次提交对象
git revert HEAD     # 恢复最后一次提交的状态

### 查看文件diff

shell
git diff <file>     # 比较当前文件和暂存区文件差异
git diff
git diff <$id1> <$id2>   # 比较两次提交之间的差异
git diff <branch1>..<branch2> # 在两个分支之间比较 
git diff --staged   # 比较暂存区和版本库差异
git diff --cached   # 比较暂存区和版本库差异
git diff --stat     # 仅仅比较统计信息
```

#### 查看提交记录####

```cpp
git log
git log <file>      # 查看该文件每次提交记录
git log -p <file>   # 查看每次详细修改内容的diff
git log -p -2       # 查看最近两次详细修改内容的diff
git log --stat      # 查看提交统计信息
```

#### tig####
```cpp
Mac上可以使用tig代替diff和log，brew install tig
```

### Git 本地分支管理###
#### 查看、切换、创建和删除分支####

```cpp
git br -r           # 查看远程分支
git br <new_branch> # 创建新的分支
git br -v           # 查看各个分支最后提交信息
git br --merged     # 查看已经被合并到当前分支的分支
git br --no-merged  # 查看尚未被合并到当前分支的分支

git co <branch>     # 切换到某个分支
git co -b <new_branch> # 创建新的分支，并且切换过去
git co -b <new_branch> <branch>  # 基于branch创建新的new_branch

git co $id          # 把某次历史提交记录checkout出来，但无分支信息，切换到其他分支会自动删除
git co $id -b <new_branch>  # 把某次历史提交记录checkout出来，创建成一个分支

git br -d <branch>  # 删除某个分支
git br -D <branch>  # 强制删除某个分支 (未被合并的分支被删除的时候需要强制)
```

#### 分支合并和rebase####

```cpp
git merge <branch>               # 将branch分支合并到当前分支
git merge origin/master --no-ff  # 不要Fast-Foward合并，这样可以生成merge提交

git rebase master <branch>       # 将master rebase到branch，相当于：
git co <branch> && git rebase master && git co master && git merge <branch>
```
### Git补丁管理(方便在多台机器上开发同步时用)###

```cpp
git diff > ../sync.patch         # 生成补丁
git apply ../sync.patch          # 打补丁
git apply --check ../sync.patch  # 测试补丁能否成功
```

### Git暂存管理###
```cpp
git stash                        # 暂存
git stash list                   # 列所有stash
git stash apply                  # 恢复暂存的内容
git stash drop                   # 删除暂存区
```

### Git远程分支管理###
```cpp
git pull                         # 抓取远程仓库所有分支更新并合并到本地
git pull --no-ff                 # 抓取远程仓库所有分支更新并合并到本地，不要快进合并
git fetch origin                 # 抓取远程仓库更新
git merge origin/master          # 将远程主分支合并到本地当前分支
git co --track origin/branch     # 跟踪某个远程分支创建相应的本地分支
git co -b <local_branch> origin/<remote_branch>  # 基于远程分支创建本地分支，功能同上

git push                         # push所有分支
git push origin master           # 将本地主分支推到远程主分支
git push -u origin master        # 将本地主分支推到远程(如无远程主分支则创建，用于初始化远程仓库)
git push origin <local_branch>   # 创建远程分支， origin是远程仓库名
git push origin <local_branch>:<remote_branch>  # 创建远程分支
git push origin :<remote_branch>  #先删除本地分支(git br -d <branch>)，然后再push删除远程分支
```

### Git远程仓库管理###
```cpp
git remote -v                    # 查看远程服务器地址和仓库名称
git remote show origin           # 查看远程服务器仓库状态
git remote add origin git@github:robbin/robbin_site.git         # 添加远程仓库地址
git remote set-url origin git@github.com:robbin/robbin_site.git # 设置远程仓库地址(用于修改远程仓库地址)
git remote rm <repository>       # 删除远程仓库
```

### 创建远程仓库###
```cpp
git clone --bare robbin_site robbin_site.git  # 用带版本的项目创建纯版本仓库
scp -r my_project.git git@git.csdn.net:~      # 将纯仓库上传到服务器上

mkdir robbin_site.git && cd robbin_site.git && git --bare init # 在服务器创建纯仓库
git remote add origin git@github.com:robbin/robbin_site.git    # 设置远程仓库地址
git push -u origin master                                      # 客户端首次提交
git push -u origin develop  # 首次将本地develop分支提交到远程develop分支，并且track

git remote set-head origin master   # 设置远程仓库的HEAD指向master分支
```

#### 也可以命令设置跟踪远程库和本地库####
```cpp
git branch --set-upstream master origin/master
git branch --set-upstream develop origin/develop
```

### 常用命令图示###

<center>![](http://o99dg8ap9.bkt.clouddn.com/git%E5%91%BD%E4%BB%A4%E6%9F%A5%E8%AF%A2%E6%89%8B%E5%86%8C1.jpg)</center>

### 流程指引###

<img src="http://o99dg8ap9.bkt.clouddn.com/git%E5%91%BD%E4%BB%A4%E6%93%8D%E4%BD%9C%E6%89%8B%E5%86%8C.png" class="full-image" />


