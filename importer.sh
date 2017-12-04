#/bin/bash

hasStow=`PATH=$PATH:. command -v stow >/dev/null; echo $?`

if [[ $hasStow -ne 0 ]]
then
  echo "Please install GNU stow through your package manager."
  exit 1
fi

# stow all files in top level dirs
for d in `ls -d */ | tr / ' '`
do
  stow -t $HOME $d
  stowResult=$?
done

if [[ $stowResult -ne 0 ]]
then
  exit $stowResult
fi
