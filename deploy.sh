projectName= 'deploy-test'
imageName= 'auto-project'

containerId=`docker ps -a | grep ${project_name} `
if ["$containerId" != ""] ; then
docker stop $containerId
docker rm $containerId
echo "Delete Container Success"
fi

imageId=`docker images | grep ${project_name} `
if["$imageId" != ""] ; then
docker rmi -f $imageId
echo "Delete Image Success"
fi

docker login -u lijiayan -p dckr_pat_mobpPjGaAth2MxK6Ww2gaCh77q4
docker pull $imageName
docker run -d -p 3000:80 --name $projectName $imageName

echo “Start Container Successs"
echo $projectName