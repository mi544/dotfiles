#!/usr/bin/env bash

query="$1"
query_kebab=$(echo "$query" | sed 's# #-#g')

output_dir="$HOME/Pictures/hypnogram"

if [ ${#query} -eq 0 ]; then
  echo 'No query received, exiting'
  exit 0
fi

if [ ${#query} -ge 75 ]; then
  echo "Please ensure the query is less than 75 characters long; right now ${#query}"
  exit 0
fi

mkdir -p "$output_dir"

echo 'Sending request to hypnogram.xyz..'

counter=0
while : ; do
    if [ $counter -gt 50 ]; then
        echo 'Exhausted 50 retries, aborting'
        exit 0
    fi

    counter=$(($counter + 1))
    hypno_response=$(curl 'https://api.hypnogram.xyz/generate' \
        --fail \
        --silent \
        -X POST \
        -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0' \
        -H 'Accept: application/json' \
        -H 'Accept-Language: en-US,en;q=0.5' \
        -H 'Accept-Encoding: gzip, deflate, br' \
        -H 'Referer: https://hypnogram.xyz/' \
        -H 'Content-Type: application/json' \
        -H 'Origin: https://hypnogram.xyz' \
        -H 'DNT: 1' \
        -H 'Connection: keep-alive' \
        -H 'Sec-Fetch-Dest: empty' \
        -H 'Sec-Fetch-Mode: cors' \
        -H 'Sec-Fetch-Site: same-site' \
        -H 'TE: trailers' \
        --data-raw '
            {
                "algorithm": "Hypnogram/1.1.1",
                "prompt": "'"$query"'",
                "high_resolution": false
            }')

    echo 'Response:'
    echo "$hypno_response"

    if [ ${#hypno_response} -eq 0 ]; then
        echo "Error in response, image_id was not captured"
        exit 0
    fi

    error_code=$(echo "$hypno_response" | jq '.error_code' | sed 's#"##g')

    if [[ "$error_code" = 'STANDARD_QUEUE_FULL' ||
          "$error_code" = 'TOO_FAST' ]]; then
        echo 'Error encountered, waiting 10 seconds...'
        echo "[$error_code]"

        wait_time=$((7 + $RANDOM % 21))
        echo "Waiting $wait_time seconds.."
        sleep $wait_time

        echo 'Retrying'
        continue
    fi

    break
done

image_id=$(echo "$hypno_response" | jq '.image_id' | sed 's#"##g')

echo 'image_id successfully captured'
echo "[$image_id]"

wait_time=$((7 + $RANDOM % 21))
echo "Waiting $wait_time seconds.."
sleep $wait_time

while : ; do
    output_path="$output_dir/$query_kebab.jpg"
    if [ -f "$output_path" ]; then
        file_counter=2
        while : ; do
            if [ -f "$output_dir/$query_kebab""__$file_counter.jpg" ]; then
                file_counter=$(($file_counter + 1))
                continue
            fi
            output_path="$output_dir/$query_kebab""__$file_counter.jpg"
            break
        done
    fi

    curl "https://s3.amazonaws.com/hypnogram-images/$image_id.jpg" \
        --fail \
        --silent \
        --output "$output_path"

    if [ $? -ne 0  ]; then
        echo "Image not ready yet, waiting 3 seconds.."
        sleep 3
        continue
    fi

    echo 'Image saved successfully'
    echo "[$output_path]"
    break
done
