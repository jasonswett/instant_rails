# How to use this application template

First, run the following command to initialize your Rails application.

```bash
$ rails new my_app \
-T \                                      # Skip Minitest
-d postgresql \                           # Use PostgreSQL as the RDBMS
-m rails_application_template/template.rb # Use template.rb as the application template
```

Note that you'll need to prefix `rails_application_template/template.rb` with wherever you actually extracted this repository to.

Next, start PostgreSQL and Redis by running `docker-compose up`.

```bash
$ docker-compose up
```

Then run `bin/setup` to finish the initialization.

```bash
$ bin/setup
```

Lastly, start your Rails server and proceed as normal.

```
$ rails server
```

You're reading to start coding!
