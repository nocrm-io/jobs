# [You Don't Need a CRM](https://youdontneedacrm.com) - Technical test

This is a test is part of our hiring process. 

## Guidelines

1. **clone** the repository, don't fork it
2. Create a new branch
3. Commit your implementation of the test
4. Make a pull request and contact us !

## Requirements

* Install ruby 2.5.5 (you can use [RVM](https://www.rvm.io))
* Install [MySQL](https://www.mysql.com/)
* Install [yarn](https://yarnpkg.com/) (or [NPM](https://www.npmjs.com/) if you prefer, not documented here)
* We use [`rspec`](https://rspec.info/) as test 

### You should then be able to

Run

```
bundle
yarn
```

If you run into trouble, ensure you have the correct version of `bundler` by running `gem install bundler`

Init the database with

```
rails db:setup
rails db:seed
```

Run the test suite with 

```
rspec
```

## The test 

:fr: in French

### Introduction

Dans noCRM, les commerciaux traitent des leads, qu'ils déplacent dans leur pipeline (tunnel de vente) au fil de leur prospection.

Chaque lead a un statut (todo, standby, won, lost) - les statuts sont définis dans une constante dans le modèle Lead.

L'application "jobs" est une version très basique de noCRM qui contient uniquement le modèle Lead et la notion de statut.

L'objectif de l'exercice est de permettre à l'utilisateur de définir l'étape dans laquelle se trouve son lead, et de lui afficher un pipeline. Chaque lead appartenant à une et une seule étape (Step) du pipeline.

- Créer le modèle Step avec les champs `name` et `position` (`Integer`)
    - `name` doit être unique, minimum 3 caractères, max 32
    - `position` doit être unique
    - Dans le fichier `seed.rb`:
        - Ajouter la création de 4 étapes (par exemple dans l'ordre "Entrant", "Contacté", "Négociation", "Closing")
        - Assigner de façon aléatoire tous les leads du fichier seed à un Step
    - Écrire les tests unitaires pour le modèle Step
    - Intégrer la relation entre le Lead et le Step, et compléter les tests unitaires de Lead.
- Sur la page `leads/edit` :
    - Permettre de modifier l'étape du lead
- Quand l'utilisateur passe le lead en "won", le lead doit automatiquement passer à la dernière étape, et la probabilité doit passer à 100.
- Créer une route `/leads/pipeline` :
    - 5 leads maximum par étape, les leads modifiés le plus récemment en premier
    - Pour chaque lead, afficher le `name`, le `status` et la date de dernière modification
    - A côté du nom de l'étape, afficher :
        - le nombre **total** de leads dans le Step
        - le montant **total** représenté par ces leads

    :warning: Attention, certains de nos clients traitent des dizaines de milliers de leads dans des pipelines pouvant contenir 20 ou 30 steps, penser à optimiser le code.

Il n'est pas nécessaire pour cet exercice d'améliorer l'interface, tant qu'elle est fonctionnelle et lisible.

Une fois l'exercice terminé, archiver le code et l'envoyer à [greatjob@youdontneedacrm.com](mailto:greatjob@youdontneedacrm.com)