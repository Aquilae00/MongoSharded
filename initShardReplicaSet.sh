echo Enter Shard Pod Name:

read shardpod

echo You selected $shardpod

declare -a shard1pod


for i in {1..3}; do
    shard1pod[i]=`kubectl exec ${shardpod}-${i} -c mongodshardcontainer -- bash -c 'hostname -i'`
done

for x in shard1pod; do
    echo $x
done