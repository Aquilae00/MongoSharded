echo Enter Shard Pod Name:

read shardpod

echo You selected $shardpod

declare -a shard1pod


for i in {1..3}; do
    echo $shardpod-$i
done