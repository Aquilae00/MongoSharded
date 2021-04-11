echo Enter config Pod Name:

read configpod

echo You selected $configpod

echo Enter Replica set name:

read replset

declare -a config1pod


for i in {0..2}; do
    config1pod[i]=`kubectl exec ${configpod}-${i} -c mongodconfigcontainer -- bash -c 'hostname -i'`
done

for x in ${config1pod[*]}; do
    echo $x
done

echo Adding replica hostnames to the config


replicasetInit() {
    kubectl exec ${configpod}-0 -c mongodconfigcontainer -- mongo --eval 'rs.initiate({_id:"'$replset'",configsvr:true,members:[{_id:0,host:"'${config1pod[0]}':27017"},{_id:1,host:"'${config1pod[1]}':27017"},{_id:2,host:"'${config1pod[2]}':27017"}]})'
}

replicasetInit