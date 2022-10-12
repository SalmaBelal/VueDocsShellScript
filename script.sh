#!/bin/bash

group_md(){

cd $1
echo $1

mdfiles=(*.md)
if [ ${#mdfiles[@]} -eq 0 ]; then
    echo "here"
    return
fi

directories=(*/)
if [ ${directories[@]} = "*/" ]; then
    directories=()
fi

echo '' > toc
for i in *.md
do 
echo "$i" >> toc
done
echo '' > ${PWD##*/}.md
for i in $(cat toc)
do
cat $i >> ${PWD##*/}.md
done

for i in ${directories[@]}
do 
directory="${1}/${i}" 
echo ${directory}
group_md ${directory}
done

}

group_md $(pwd)

