#!/bin/bash
name=$1
name_lowercase=$(echo "$name" | tr '[:upper:]' '[:lower:]')
modname="$(tr '[:lower:]' '[:upper:]' <<< ${name_lowercase:0:1})${name_lowercase:1}"

name_lowercase_web=$(echo "$name_lowercase"_web)

find . -type f -name '*.ex' -exec sed -i '' s/Phxlite/$modname/g {} +
find . -type f -name '*.exs' -exec sed -i '' s/Phxlite/$modname/g {} +
find . -type f -name '*.exs' -exec sed -i '' s/phxlite/$name_lowercase/g {} +
find . -type f -name '*.ex' -exec sed -i '' s/phxlite/$name_lowercase/g {} +

mv lib/phxlite.ex lib/${name_lowercase}.ex
mv lib/phxlite_web.ex lib/${name_lowercase}_web.ex

mv lib/phxlite lib/$name_lowercase
mv lib/phxlite_web lib/${name_lowercase}_web
