## 1 基础知识

![](img/git-arch.png) 

* Workspace：工作区
* Index/Stage：暂存区
* Repository：仓库区(或本地仓库)
* Remote：远程仓库

```
$ mkdir git-demo-project
$ cd git-demo-project/
$ git init
Initialized empty Git repository in /data2/allen/git/git-demo-project/.git/
$ ls .git
branches  config  description  HEAD  hooks  info  objects  refs
```

## 2 提升知识

#### 2.1 merge

```
    a - b - c - d   Master
         \
           e - f - g Feature

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    a - b - c - d - f   Master
         \           \
           e - f - g - h    Feature
```


#### 2.2 rebase

```
    a - b - c - d   Master
         \
           e - f - g Feature

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    a - b - c - d - f   Master
                     \
                      e' - f' - g'    Feature
```


#### 2.3 cherry-pick

git cherry-pick命令的作用，就是将指定的提交（commit）应用于其他分支。

```
    a - b - c - d   Master
         \
           e - f - g Feature

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    a - b - c - d - f   Master
         \
           e - f - g Feature
```


```
$ git checkout master
# Cherry pick 操作
$ git cherry-pick f
```

#### 2.4 合并多个commit

###### 2.4.1 使用rebase  

```
$ git rebase -i HEAD~3
```

进入编辑业务，将后两个commit操作修改成squash  

```
pick 8013af8 commit-message1
s f4f26c2 commit-message2
s 9b52555 commit-message3

# Rebase c079db3..9b52555 onto c079db3 (3 commands)
```

执行rabase操作

```
[detached HEAD 816f604] commit
 Author: yufei.liu <yufei.liu@wolaidai.com>
 Date: Wed Mar 13 20:18:14 2019 +0800
 2 files changed, 35 insertions(+), 38 deletions(-)
Successfully rebased and updated refs/heads/xxx.
$ git log --pretty=oneline -n 5
$ git reset --hard 9b52555
```

###### 2.4.2 使用rest

使用git reset完成commit合并

```
# 使用默认的mixed模式重置，只更新索引空间
$ git reset HEAD~3
$ git add .
$ git commit -am "merge commit"
$ git push --force
```

#### 2.5 查看文件修改

找到历史代码的提交时间、提交者。

```
$ git blame pom.xml
85d078aa902 (chadshao                2017-11-08 10:43:34 +0800   1) <?xml version="1.0" encoding="UTF-8"?>
85d078aa902 (chadshao                2017-11-08 10:43:34 +0800   2) <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
a35530af1a3 (Zane                    2019-04-07 13:12:52 +0800   3)     <modelVersion>4.0.0</modelVersion>
a35530af1a3 (Zane                    2019-04-07 13:12:52 +0800   4)     <groupId>com.wolaidai</groupId>
a35530af1a3 (Zane                    2019-04-07 13:12:52 +0800   5)     <artifactId>pangu</artifactId>
```

## 3 底层原理 

```
$ ls .git
branches  COMMIT_EDITMSG  config  description  HEAD  hooks  index  info  logs  objects  packed-refs  refs
```

其中Git的核心组成部分如下：
* objects目录: 存储所有数据内容
* refs目录: 存储指向数据（分支、远程仓库和标签等）的提交对象的指针 
* HEAD文件: 指向目前被检出的分支
* index文件: 保存暂存区信息

#### 3.1 objects
相当一张数据库中的表，每条记录主键是40个长度的SHA-1哈希值校验和。所有的文件(blob)、目录(tree)、版本(commit)都是相当于条记录。
以pangu项目的为例，从master分支上顺便挑选一个commit(1c47205607665179f6c4aff9b1db1e4bd6f424a0)。

```
$ git cat-file -t 1c47205607665179f6c4aff9b1db1e4bd6f424a0
commit
$ git cat-file -p 1c47205607665179f6c4aff9b1db1e4bd6f424a0
tree 830360e9d6326c3d7d6340bfe5902b3eaf5dd08c
parent 7abb4563ff5cf61d1d51e9a6a375241ec1d51971
parent b39e8be97b06eb8debc908771633703b7e069297
author bruce.he <bruce.he@welab-inc.com> 1604023413 +0800
committer bruce.he <bruce.he@welab-inc.com> 1604023413 +0800

Merge branch 'bruce/202010127/isVirtualnumber_kudu' into 'master'

同步kudu，是否虚拟手机号

See merge request !4140
```
从上述命令可以看出这是个commit提交记录，这是个merge commit。里面有tree节点id、上游commit节点id、作者、提交信息等。
然后我们查看下830360e9d6326c3d7d6340bfe5902b3eaf5dd08c这个tree节点的内容。

```
$ git cat-file -t 830360e9d6326c3d7d6340bfe5902b3eaf5dd08c
tree
$ git cat-file -p 830360e9d6326c3d7d6340bfe5902b3eaf5dd08c
100644 blob a46306f25582bec378bd116888941845bfb13695    .gitignore
100644 blob ef9077f2b940eb1743ab9d188cd9f20a09d9b81a    README.md
100644 blob b0428b1a0e6c8370781e4bca90730d3a27c25446    "UAT\346\217\220\346\265\213\350\257\264\346\230\216.md"
040000 tree 0632dc0a6e3b720440626aa16bd799a1848227d3    assembly
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    derby.log
040000 tree fddd3a536530c107606057a1f077f5aafe04e42c    pangu-app
040000 tree c6e97aa4551efcff0bdb9cdcbe2f2814e432b59d    pangu-common
040000 tree 1c88a86d25e83a0a42dd6d0a1e39bd38c7db7dda    pangu-data
040000 tree dedbb32c2faa6fef4bf42cd91bed6daaa07be3f0    pangu-doc
040000 tree 3b2812f6e666bb8438ee5bb17ff306966dd1361d    pangu-entity
040000 tree 43b6b45e963254eae7d216bfab815dcdb2d0853b    pangu-flink
040000 tree 9eae84220b216c1c7ade38e2640c8845dffc4b30    pangu-kafka
040000 tree b92da154b64bd707b6107fc41dcd84add7f2288c    pangu-parser
040000 tree cf8aefc3682fb7c2e00d1ea62e1af75f9c96169f    pangu-sdk
040000 tree a7353c3d6031f086b57fc00a93dceb72d503ea5c    pangu-spark
040000 tree 7736d507fe99c70b38b292f660bea7afeb95ceac    pangu-test
040000 tree fa6d3c0a022229b016133ec82cd6b0d447be689f    pangu-utils
100644 blob 2103fb6938bb0a2b45916524572b58480a6b059c    pom.xml
040000 tree a45914df71d6384a1dea44f2eb3b95f90dc91d85    wedataground
```

从上述命令我们可以清楚看到该commit根目录下的快照。然后我们查看下pom.xml这个文件的内容。

```
$ git cat-file -t 2103fb6938bb0a2b45916524572b58480a6b059c
blob
$ git cat-file -p 2103fb6938bb0a2b45916524572b58480a6b059c
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.wolaidai</groupId>
    <artifactId>pangu</artifactId>
    <version>1.0.0</version>

```

```
# 使用hash-object命令
$ git init test
Initialized empty Git repository in /data2/allen/git/test/.git/
$ cd test
$ find .git/objects -type f
$ echo 'test content' | git hash-object -w --stdin
d670460b4b4aece5915caf5c68d12f560a9fe3e4
$ find .git/objects -type f
.git/objects/d6/70460b4b4aece5915caf5c68d12f560a9fe3e4

# 使用add命令
$ echo 'test content2' > test.txt
$ git add test.txt
$ find .git/objects -type f
.git/objects/d6/70460b4b4aece5915caf5c68d12f560a9fe3e4
.git/objects/4c/4c5cdd3f7e76632060ade0602df7ed76deaea7

# 查看文件
$ git cat-file -p 4c4c5cdd3f7e76632060ade0602df7ed76deaea7
test content2
```

#### 3.2 refs

.git/refs/remotes: 远程分支commit节点id
.git/refs/heads: 本地分支commit节点id
.git/refs/tags: 本地标签对应节点的id，注意tag节点与commit类型，都是指向tree。

```
git commit -m 'commit for refs'
[master (root-commit) 36109ce] commit for refs
 1 file changed, 1 insertion(+)
 create mode 100644 test.txt
$ find .git/refs -type f
.git/refs/heads/master
$ git branch -a
* master
$ cat .git/refs/heads/master
36109ce267002d25ffb703fe5e825ce54e6da539
$ git cat-file -p 36109ce267002d25ffb703fe5e825ce54e6da539
tree 31d347682e9215dbcfa8121680dc4cbc00b04258
author Your Name <you@example.com> 1604373570 +0800
committer Your Name <you@example.com> 1604373570 +0800

commit for refs

## tag相关的命令
$ git tag -a v1.4 -m "my version 1.4"
$ git tag
v1.4
$ cat .git/refs/tags/v1.4 
a512d6a81fe4320ec044348f5ec58717467e9291
$ git cat-file -t a512d6a81fe4320ec044348f5ec58717467e9291
tag
$ git cat-file -p a512d6a81fe4320ec044348f5ec58717467e9291
object 36109ce267002d25ffb703fe5e825ce54e6da539
type commit
tag v1.4
tagger Your Name <you@example.com> 1604374116 +0800

my version 1.4
``` 

#### 3.3 HEAD

标记当前工作空间是哪个分支，checkout就是修改这个文件。

```
$ cat .git/HEAD
ref: refs/heads/master
$ git symbolic-ref HEAD
refs/heads/master
```

#### 3.4 index

记录暂存区中的文件。

```
$ git ls-files --stage
100644 190a18037c64c43e6b11489df4bf0b9eb6d2c9bf 0	test.txt
```

## 4 冲突

递归三路合并算法 

简单的冲突演示
```
$ git init test
Initialized empty Git repository in /data2/allen/git/test/.git/
$ cd test
$ echo "init workspace" > readme.txt
$ git add . 
$ git commit -am "init"
[master (root-commit) 3f29c0f] init
 1 file changed, 1 insertion(+)
 create mode 100644 readme.txt

$ git checkout -b feature1
Switched to a new branch 'feature1'
$ echo "second commit" > readme.txt
$ git add . 
$ git commit -am "second"
[feature1 98ad0e3] second
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git checkout master
Switched to branch 'master'
$ echo "third commit" > readme.txt
$ git add . 
$ git commit -am "third"
[feature1 b4a450e] third
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git merge feature1
Auto-merging readme.txt
CONFLICT (content): Merge conflict in readme.txt
Automatic merge failed; fix conflicts and then commit the result.
```

 

## 5 工作流

github工作流：http://www.ruanyifeng.com/blog/2015/08/git-use-process.html  
gitlab工作流：http://www.ruanyifeng.com/blog/2015/12/git-workflow.html    

## 6 参考文档

官方文档： https://git-scm.com/book/zh/v2

rabase介绍：https://blog.csdn.net/hudashi/article/details/7664631/

git合并原理：https://blog.csdn.net/u012937029/article/details/77161584

git序列知识：  
http://www.ruanyifeng.com/blog/2012/07/git.html  
http://www.ruanyifeng.com/blog/2015/08/git-use-process.html  
http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html  
http://www.ruanyifeng.com/blog/2018/10/git-internals.html  
http://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html  
http://www.ruanyifeng.com/blog/2015/12/git-workflow.html  