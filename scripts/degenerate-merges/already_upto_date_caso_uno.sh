#!/bin/sh

alias git='LC_ALL=en_US git'

echo "|-----> COMMIT 1 EN RAMA main <-----|"

echo -e "\n== Commit uno main" >> README.adoc
    git commit README.adoc -m 'Cambio uno main'

echo -e "\n|-----> SE CREA LA RAMA develop + CAMBIO A LA RAMA develop <-----|"
    git checkout -b develop

echo -e "\n|-----> SE CREAN 3 COMMITS EN develop <-----|"

echo -e "\n== Cambio uno develop" >> README.adoc
    git commit README.adoc -m 'Cambio uno develop'

echo -e "\n== Cambio dos develop" >> README.adoc
    git commit README.adoc -m 'Cambio dos develop'

echo -e "\n== Cambio tres develop" >> README.adoc
    git commit README.adoc -m 'Cambio tres develop'

echo -e "\n|-----> CAMBIO A LA RAMA main Y MERGE DE develop en main <-----|"
    git checkout main
    git merge develop

echo -e "\n|-----> SE INTENTA NUEVAMENTE EL MERGE DE develop en main PARA OBTENER EL MENSAJE<-----|"
    git merge develop
