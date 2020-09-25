input="-payload-path"
while IFS= read -r line
do
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" --cookie "-cookie-value-" -domain-name-"$line")
  if [ $STATUS_CODE -eq 200 ]; then
    echo "-domain-name-$line" >> /home/kali/Desktop/output.txt
  else 
   echo "$STATUS_CODE"
   echo "$line"
  fi
done < "$input"
