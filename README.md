## 生成随机数写入数据库并验证  

#### R + plumber + docker  

##### 包含内容:
1. 生成随机数接口test\_docker  
2. 调用test\_docker生成20组随机数  
3. 将生成的随机数存入docker中的MongoDB数据库  
4. 验证数据数量接口validator  

##### 获取方式  
1. `git clone git@github.com:Wangyazhu16/app.git`  
2. `cd app`  
3. `git submodule init && git submodule update`  
4. `docker-compose build`

##### 开启服务  
`docker-compose up`  

##### 停止服务  
`docker-compose stop`  

##### 关闭服务  
`docker-compose down`