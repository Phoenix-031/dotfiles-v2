#!/bin/bash

# Check if the input argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 git@github.com:username/repository.git@domain"
  exit 1
fi

# Extract the input string
input="$1"

# Use a regular expression to match and extract parts of the string
if [[ "$input" =~ git@github.com:([^/]+)/([^@]+).git@([^ ]+) ]]; then
  username="${BASH_REMATCH[1]}"
  repo="${BASH_REMATCH[2]}"
  domain="${BASH_REMATCH[3]}"
  # Construct the new URL
  new_url="git@$domain.github.com:$username/$repo.git"
  echo "Converted URL: $new_url"

  # Clone the repository using the new URL
  git clone "$new_url"
else
  echo "Input does not match the required pattern."
  exit 1
fi
