#!/bin/bash

helm undelete -n dce$USER sonarqube  
kubectl delete pvc data-sonarqube-postgresql-0 -n dce$USER
kubectl delete pvc data-sonarqube-postgresql-1 -n dce$USER
kubectl delete pvc data-sonarqube-postgresql-2 -n dce$USER
kubectl delete pvc data-sonarqube-postgresql-0 -n dce$USER
kubectl delete ns dce$USER 

for i in `ls -la *.ipynb|awk '{print $9}'`
do
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace $i 
done
echo "Reset NoteBook Finish"
