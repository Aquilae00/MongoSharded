echo Enter Shard Pod Name:

read shardpod

echo You selected $shardpod

for i in 3; do
    echo `${shardStsName}-${i}`
done