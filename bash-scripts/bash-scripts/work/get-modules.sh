#!/usr/bin/env bash

cd $HOME/projects/peak
booj_modules_paths=$(yarn lerna --loglevel silent exec pwd |
  sed '1,2d' |
  sed '$d'
)

for module_path in $booj_modules_paths
do
  cd $module_path
  required_modules=$(rg "(@booj/[a-z-]*)[/']" -r '$1' -g '!package.json' \
    --no-filename --no-heading --no-line-number \
    --no-messages --only-matching |
    sort --unique |
    sed 's/\(.*\)/"\1": "1.0.0",/'
  )

  sed -i '/^[[:space:]]*"@booj\/[a-z\-]*"/d' package.json

  # deps_line_num=$(cat -n package.json |
    # rg "\"dependencies\": \{" --column |
    # cut -d':' -f1
  # )
# 
  # if [ $deps_line_num -gt 0 ] 2>/dev/null
  # then
    # start=$(head -n $deps_line_num package.json)
    # ending=$(tail -n $deps_line_num)
    # echo "$start $required_modules $ending"
  # else
    # echo nay
  # fi

  echo "$required_modules">>package.json
done

