#!/bin/bash

base_path="$HOME/sites/"
echo "Path new nodejs typescript project: "
read path
full_path="$base_path$path"
echo "Create project in: $full_path"
mkdir -p -v "$full_path/src"
cd $full_path

if [[ "$(pwd)" != "$full_path" ]]; then
    echo "Could not switch to new folder $full_path"
    exit 1
fi

npm init -y
npm install --save-dev typescript eslint tsx @types/node

cat << JSON > "$full_path/tsconfig.json"
{
  "compilerOptions": {
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es6",
    "moduleResolution": "node",
    "sourceMap": true,
    "outDir": "dist"
  },
  "lib": ["es2015"]
}
JSON

cat << TS > "$full_path/src/app.ts"
    console.log("hello world")
TS

npm init @eslint/config@latest

