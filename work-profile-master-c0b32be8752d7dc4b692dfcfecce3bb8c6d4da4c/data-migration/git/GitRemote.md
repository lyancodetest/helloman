由于项目较多且window下bat脚本编写复杂，特地写了个java类，项目较多的同学可以尝试下，源文件及编译后的类文件都在此目录。
原理是替换.git\config中的url，从 `git.wolaidai.com` --> `git.welab-inc.com`。

## 校验
java GitRemote --check [dir]  
[dir]为idea的工作空间，会递归子目录更新，下同。
```
E:\eclipse-workspace\git\work-profile\data-migration\git>java GitRemote --check E:\eclipse-workspace\git
E:\eclipse-workspace\git\activity-platform\.git\config
        url = git@git.wolaidai.com:WelabCo/Operate/activity-platform.git
E:\eclipse-workspace\git\agent\.git\config
E:\eclipse-workspace\git\Agent-Benchmarks\.git\config
E:\eclipse-workspace\git\agent-integration-test-report\.git\config
...
```

## 替换
java GitRemote --replace [dir]

```
E:\eclipse-workspace\git\work-profile\data-migration\git>java GitRemote --replace E:\eclipse-workspace\git
E:\eclipse-workspace\git\activity-platform\.git\config
E:\eclipse-workspace\git\agent\.git\config
E:\eclipse-workspace\git\Agent-Benchmarks\.git\config
...
```

## 验证
```
E:\eclipse-workspace\git\work-profile\data-migration\git>cd E:\eclipse-workspace\git\activity-platform

E:\eclipse-workspace\git\activity-platform>git remote -v
origin  git@git.welab-inc.com:WelabCo/Operate/activity-platform.git (fetch)
origin  git@git.welab-inc.com:WelabCo/Operate/activity-platform.git (push)
```