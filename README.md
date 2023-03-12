# Agro Reports

This project is focused on generating the report that an agronomist engineer in
an inspection report document of plantations and recipes to combat pests, in
order to improve the quality of the plant and its fruit as well as to avoid
diseases.

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

Setup:

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

### Run local server
`$ bin/dev` 

Open a browser and go to:

http://localhost:3000/

## Run tests
Run all test:
`$ rails test` or `$ bin/rails test`

Run only one file test:
`$ rails test test/models/article_test.rb`

## Rubocop and Standard Rb

Ruby style guide, linter, and formatter
`bundle exec rubocop -A `

## Use Cases

- As user I can create an account and sign in into the app
- As a signed in admin I can invite other users to my account as collaborators
- As a signed in admin I can manage Clients
- As a signed in admin/collaborator I can create a report

## Data model

### Account
- name

### User
- name
- email

### Membership
- Account
- User

### Client
- first_name
- last_name
- email
- phone

## Crop
- name

### Sector
- identifier
- Crop

### Report
- status
- phenological_state
- visited_at
- sowing_in

