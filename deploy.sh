user_name=$1
image_name=$2
PORT=$3
CONTAINS_PORT=$4

if [ "$1" == "" ]  || [ "$2" == "" ] || [ "$3" == "" ] ; then 
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
docker run -d -p $3:$4 --name $image_name ${user_name}/${image_name}:latest
echo "Start Container Successs"
echo "$image_name"
