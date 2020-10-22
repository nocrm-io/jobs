# [You Don't Need a CRM](https://youdontneedacrm.com) - Technical test

This test is part of our hiring process. 

## Guidelines

1. **Clone** the repository, don't fork it
2. Create a new branch
3. Commit your implementation of the test
4. Make a pull request on your repository 
5. Make the repo private and invite us (@guv3n) to access it. 

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

### Partie 1

L'objectif est de permettre à l'utilisateur de définir l'étape dans laquelle se trouve son lead, et de lui afficher un pipeline. Chaque lead appartenant obligatoirement à une et une seule étape (Step) du pipeline.

- Créer le modèle Step avec les champs `name` et `position` (`Integer`)
    - `name` doit être unique, minimum 3 caractères, max 32
    - `position` doit être unique
    - Dans le fichier `seed.rb`:
        - Ajouter la création de 4 étapes (par exemple dans l'ordre "Entrant", "Contacté", "Négociation", "Closing")
        - Répartir tous les leads dans les 4 étapes, de façon égale, en mettant les 25 premiers leads (25 premiers ID) dans la 1ère étape, les 25 suivants dans la 2ème, etc)
        - :warning: **Ne pas modifier les updated_at des leads.**
    - Intégrer la relation entre le Lead et le Step
- Sur la page `leads/edit` :
    - Permettre de modifier l'étape du lead
- Quand un lead passe au statut "won", il doit automatiquement passer à la dernière étape, et sa probabilité doit passer à 100.
- Compléter les tests unitaires du lead
- Créer une route `/leads/pipeline` :
    - Cette page affiche autant de colonnes que d'étapes (Step)
    - Afficher 5 leads par étape, triés par ordre de dernière modification
    - Pour chaque lead, afficher le `name`, le `status`, l'`amount` et la date de dernière modification
    - A côté du nom de l'étape, afficher :
        - le nombre **total** de leads dans le Step
        - le montant **total** représenté par ces leads
        
### Partie 2

L'objectif est de fournir à l'utilisateur une page de statistiques sur la performance de ses leads.<br/>
Créer une page qui affiche des statistiques par période : **semaine** ou **mois**<br/>
La page affiche les 5 dernières périodes + la période courante.<br/>
Si nous sommes en octobre et en statistiques par mois, afficher les mois mai à octobre<br/>
Si nous sommes en semaine 18 et en statistiques par semaine, afficher les semaines 13 à 18<br/>

L'utilisateur doit pouvoir changer la période (semaine ou mois)

Pour chaque période, afficher : 
- le nombre de leads créées
- parmis ces leads, le nombre de "won", le nombre de "lost", et le nombre d'"active" (active = "todo" + "standby")

Exemple :

- 7 opportunités créées<br/>
-- 2 won<br/>
-- 3 lost<br/>
-- 2 active<br/>
