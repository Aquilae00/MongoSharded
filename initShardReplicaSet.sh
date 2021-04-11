echo Enter Shard Pod Name:

read shardpod

echo You selected $shardpod

declare -a shard1pod


for i in {0..2}; do
    shard1pod[i]=`kubectl exec ${shardpod}-${i} -c mongodshardcontainer -- bash -c 'hostname -i'`
done

for x in ${shard1pod[*]}; do
    echo $x
done

echo Adding replica hostnames to the shard


replicasetInit() {
    kubectl exec ${shardpod}-0 -c mongodshardcontainer -- mongo --eval 'rs.initiate({_id:"mongoreplicaset1shard",members:[{_id:0,host:"'$shard1pod[0]':27017"},{_id:1,host:"'$shard1pod[1]':27017"},{_id:2,host:"'$shard1pod[2]':27017"}]})'
}

replicasetInit