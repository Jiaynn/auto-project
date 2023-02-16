## 一个基于Git Actions 的 CI/CD 流程

### ✨ Features
- 🌈 eslint、prettier
- 📦 husky
- 🛡 git-cz
- ⚙️ 基于nginx部署的docker
- 🌍 在pull request时触发 CI/CD
- 🎨 基于vitest的功能测试（还在完善中...）
### Install
```
pnpm install
pnpm dev
```
### 提交
```
git add .
pnpm start
git push origin 分支名
```
### 目录结构
```
auto-project   
├─ .github
│  ├─ workflows
│  │  ├─ ci.yml      # 触发 ci 的 yml 文件
├─ .husky
│  ├─ commit-msg.sh  # 执行 commitlint 的脚本
│  ├─ pre-commit.sh  # 提交 commit 之前，执行 lint-staged 命令
├─ dist                                    
├─ public                                  
├─ src                       
│  ├─ assets                        
│  ├─ App.tsx                
│  ├─ main.tsx               
│  └─ vite-env.d.ts          
├─ Dockerfile              # 基于Dockerfile文件生成镜像             
├─ README.md                 
├─ commitlint.config.js    # commitlint检查，提交时检查commit信息是否符合规范  
├─ deploy.sh               # 登录服务器后的执行脚本，写在服务器中             
├─ index.html                
├─ nginx.conf              # nginx配置文件             
├─ package.json              
├─ pnpm-lock.yaml            
├─ tsconfig.json             
├─ tsconfig.node.json        
├─ vite.config.ts            
└─ vitest.config.ts          

```