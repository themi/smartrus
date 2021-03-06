# Smart R Us

Disambiguation:  `smart are us`.  my intention is for __you__ to assert yourself as being part of the "Us" when you read or say "smart are us!".

Alternative pronounciation:  `smart-arse`  (lol)

Noun: The self paced training website/app `smartrus.net` developed by [timothyjohnhemi](hemi.co.nz).

Verb: learn what others have to teach - teach others what you have learnt.

Adjective: (of a person) intelligent, understanding, creative


## Local setup

* clone the repo

```bash
git clone git@github.com:themi/smartrus-app.git
cd smartrus-app
```
* setup your ruby manager for ruby `2.5.1` and gemset `smartrus`

* setup app

```bash
./bin/setup
```

* obtain the `master.key` from Tim and update `/.env`

```ruby
RAILS_MASTER_KEY=REPLACE_ME
DEFAULT_HOST=localhost
```

## Tests

```
rails_best_practices .
brakeman
rubocop
./bin/rails spec
```

## Smoke Test

```bash
Student Login: your+student@email.com Password: Password1!
Supervisor Login: your+supervisor@email.com Password: Password1!
Admin Login: your+admin@email.com Password: Password1!
```

* spin it up

```
bundle exec rails server
```

* open browser at `localhost:3000`

  - Sign in as student - should lead you to student dashboard
  - Sign in as supervisor - should lead you to supervisor dashboard
  - Sign in as admin - should lead you to admin dashboard


