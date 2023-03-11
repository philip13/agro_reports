# Agro Reports

This project is focused on generating the report that an agronomist engineer in an inspection report document of plantations and recipes to combat pests, in order to improve the quality of the plant and its fruit as well as to avoid diseases.

## Environment
- Ruby Verion '3.1.1'
- Bundle version '2.3.7'
- postgress
- Default port: 3000


## Getting Started
Open a new terminal and type:

`$ git clone git@github.com:philip13/agro_reports.git`

Go to the downloaded folder and install:

```
$ cd agro_reports
$ bundle install
```

Database:

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

### Run local server
`$ bin/dev` 

Open a browser and go to:

http://localhost:3000/


### Credential roles 

## Run tests
Run all test:
`$ rails test` or `$ bin/rails test`

Run only one file test:
`$ rails test test/models/article_test.rb`

## Rubocop and Standard Rb 
Ruby style guide, linter, and formatter
`bundle exec rubocop -A `