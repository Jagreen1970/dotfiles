#!/usr/bin/env bash

echo "================================"
echo "Hello World"
echo "================================"

for file in $(find . -name '*.go'); do
    goimports -w "$file"
done

