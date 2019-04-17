#!/bin/bash

commitmessage="$1"
pushbranch="$2"

git_add () { 
  git add -A
}

git_commit () {
  if [ -n "$commitmessage" ] 
  then 
    echo "Please add a commit message"
    read -p 'Commit Message: ' commitmessage
    echo 
    git commit -m "$commitmessage"
  fi
  
}

git_push () {
  if [ -n "$pushbranch" ]
  then 
    echo "No branch entered. Push to master?"
    read -p 'y/n: ' pushbranch
    if [ $pushbranch = "y"]; then
      git push origin master
      exit 0
    else
      "No branch entered. Exiting..."
      exit 1
    fi
  else
    git push origin "$2"
  fi
}

main () {
  git_add
  git_commit
  git_push
}

main