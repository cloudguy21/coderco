#!/bin/bash

while IFS='=' read -r key value
do
    echo "Key: $key"
    echo "Value: $value"
done < settings.conf