# What Instant Rails is

Instant Rails is a [Rails application template](https://guides.rubyonrails.org/rails_application_templates.html) that comes with certain common tools, like Devise and RSpec, pre-installed.

Instant Rails is a special kind of Rails application template. Instant Rails will generate your application **inside of a Docker container** so that you don't even need to have Ruby, Rails, PostgreSQL or anything else installed on your computer in order to generate a Rails app.

# Why I created Instant Rails

I have a relatively frequent need to create "throwaway" Rails apps for educational purposes. I created Instant Rails to help me with two problems:

1. Even though it's not that much work to create a new Rails application, it's still too tedious to do all the Rails project initialization work every time I want a new project.
2. For students, it's often too hard for them to get my projects set up on their computer (especially, often, the PostgreSQL-related parts).

A Dockerized application template helps solve both these problems.

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

Once the script finishes, you can visit `localhost:3001` (note that it's `3001`, not `3000`) and see your app running.

# Get help

To get help, just open an issue or email me at jason@codewithjason.com.

# Acknowledgements

This project was inspired in part by Mike Rogers' [Docker/Rails template](https://github.com/Ruby-Starter-Kits/Docker-Rails-Template).
