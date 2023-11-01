#!/bin/bash 

folders=("ebs" "ec2" "eip" "sg")

for folder in "${folders[@]}"; do
    echo "Fomatting files in $folder"
    cd "$folder" || exit 1
    terraform fmt
    cd ..
done