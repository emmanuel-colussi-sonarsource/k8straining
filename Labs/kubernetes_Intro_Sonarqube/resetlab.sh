#!/bin/bash

kubectl delete ns student1
/bin/rm -r sonarlogs

for i in `ls -la *.ipynb|awk '{print $9}'`
do
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace $i 
done
echo "Reset NoteBook Finish"
