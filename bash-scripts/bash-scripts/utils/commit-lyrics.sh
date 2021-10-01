lyrics=$(tac $2)
cd $1
IFS=$'\n'
for line in $lyrics
do
  echo "$line"
  git commit --no-verify --allow-empty -m "$line"
  sleep 5
done
unset IFS
