# What Instant Rails is

Instant Rails is a [Rails application template](https://guides.rubyonrails.org/rails_application_templates.html) that comes with certain common tools, like Devise and RSpec, pre-installed.

Instant Rails is also a special kind of Rails application template. Instant Rails will generate your application **inside of a Docker container** so that you don't even need to have Ruby, Rails, PostgreSQL or anything else installed on your computer in order to generate a Rails app.

# How to use Instant Rails

## Prerequisites

In order to use Instant Rails, you must have Docker installed.

## Usage instructions

First, clone the repo.

```bash
git clone https://github.com/jasonswett/instant_rails.git
cd instant_rails
```

Then run the `init.sh` script.

```bash
./init.sh your_app_name
```

This script will create a Rails application and start a Rails server.

Once the script finishes, you can visit `localhost:3000` and see your app running.

## Get help

To get help, just open an issue or email me at jason@codewithjason.com.

## Acknowledgements

This project was inspired in part by Mike Rogers' [Docker/Rails template](https://github.com/Ruby-Starter-Kits/Docker-Rails-Template).
