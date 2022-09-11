#!/bin/env bash
os=`uname`
command_head="grep $'^"
if [ $os = "Darwin" ]; then
  command_head="grep -E '^"
fi

command_tail="[a-z]' en_cn.txt|wc -l"

tabs=""
date_str=`date +"%Y-%m-%d"`
echo -n "- ${date_str}" >> README.org

for ((i = 0; i < 5; i++)); do
  command=${command_head}${tabs}${command_tail}
  echo -n -e "\t" >> README.org
  result=`eval ${command}`
  echo -n "${result}" >> README.org
  tabs=${tabs}"\t"
done

echo "" >> README.org
git add en_cn.txt README.org
git ci -m 'Update statistics'
git push
