# Posts list

Ruby on rails + vue project

## How to run

### Setup

```
  bundle install 
  npm i 
  rails db:create db:migrate
  rails db:seed
```

### Back End

```
  bin/rails server
```


### Front End

```
  bin/shakapacker-dev-server 
```

### Tests

```
  bundle exec rspec
```


### E2E

Back-end and front-end servers should be running before launching cypress:

```
  npm run cy:headless
```
