#!/bin/bash

git_add () { 
  git add -A
}

git_commit () {
  if [ -n "$1" ] 
  then 
    echo "Please add a commit message"
    read -p 'Commit Message: ' commit_message
    git commit -m "$commit_message"
  fi
  git commit -m "$1"
}

git_push () {
  if [ -n "$2" ]
  then 
    echo "No branch entered. Push to master?"
    read -p 'y/n: ' push_branch
    if [ $push_branch = "y"]; then
      git push origin master
    else
      "No branch entered. Exiting..."
      exit 1
    fi 
  fi
  git push origin "$2"
}

main () {
  git_add
  git_commit
  #git_push
}

main