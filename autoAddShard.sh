echo Enter router pod name:

read routerPodName

echo Enter shard statefulset name:

read shardStsName

echo Enter shard replicaset name:

read shardRplName

echo scanning....

declare -a shardpods
for i in 3; do
    echo `${shardStsName}-${i}`