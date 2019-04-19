#!/bin/bash

commitmessage=$1
pushbranch=$2


#commit 1 test
#commit 2
#commit 3

git_add () { 
  git add -A
}

git_commit () {
  if [ -z "$commitmessage" ] 
  then 
    echo "Please add a commit message"
    read -p 'Commit Message: ' commessage
    git commit -m "$commessage"
  else
    git commit -m "$commitmessage"
  fi
}

git_push () {
  if [ -z $pushbranch ]
  then 
    echo "No branch entered. Push to master?"
    read -p 'y/n: ' branch
    if [ "$branch" == "y" ] 
    then
      git push -u origin master
      echo "Push successful. Exiting..."
      exit 0
    else
      "No branch entered. Exiting..."
      exit 1
    fi
  else
    git push origin "$pushbranch"
  fi
}

main () {
  git_add
  git_commit
  git_push
}

main