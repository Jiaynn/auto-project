user_name=$1
image_name=$2
PORT=$3
CONTAINS_PORT=$4

if [ "$1" == "" ]  || [ "$2" == "" ] || [ "$3" == "" ] || [ "$4" == "" ] ; then 
  echo "请输入参数"
  exit
fi

containerId=`docker ps -a | grep ${image_name} | awk '{print $1}'`
if [ "$containerId" != "" ] ; then
docker stop $containerId
docker rm $containerId
echo "Delete Container Success"
fi

# 删除镜像
imageId=`docker images | grep ${user_name}/${image_name} | awk '{print $3}'` 
if [ "$imageId" != "" ] ; then
docker rmi -f $imageId
echo "Delete Image Success"
fi

docker login -u lijiayan -p dckr_pat_mobpPjGaAth2MxK6Ww2gaCh77q4
docker pull ${user_name}/${image_name}:latest
docker run -d -p $3:$4 --name $image_name --restart=always ${user_name}/${image_name}:latest
echo "Start Container Successs"
echo "$image_name"
[root@VM-12-16-centos script]# ls
deploy.sh  test.sh
[root@VM-12-16-centos script]# cat deploy.sh
user_name=$1
image_name=$2
PORT=$3
CONTAINS_PORT=$4

if [ "$1" == "" ]  || [ "$2" == "" ] || [ "$3" == "" ] || [ "$4" == "" ] ; then 
  echo "请输入参数"
  exit
fi

containerId=`docker ps -a | grep ${image_name} | awk '{print $1}'`
if [ "$containerId" != "" ] ; then
docker stop $containerId
docker rm $containerId
echo "Delete Container Success"
fi

# 删除镜像
imageId=`docker images | grep ${user_name}/${image_name} | awk '{print $3}'` 
if [ "$imageId" != "" ] ; then
docker rmi -f $imageId
echo "Delete Image Success"
fi

docker login -u lijiayan -p dckr_pat_mobpPjGaAth2MxK6Ww2gaCh77q4
docker pull ${user_name}/${image_name}:latest
# 如果服务器重启后，我们需要重新启动docker
# 执行 systemctl restart docker 重新启动docker
# 但docker启动了，里面的镜像没有启动，所以我们添加--restart=always ，在启动容器后，镜像也能重新启动
# dokcer ps -a 查看所有的容器
docker run -d -p $3:$4 --name $image_name --restart=always ${user_name}/${image_name}:latest
echo "Start Container Successs"
echo "$image_name"
