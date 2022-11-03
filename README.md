# What problem does Instant Rails solve?

As easy as it is to set up a Rails project, it could be easier.

When you run `rails new`, it does a lot for you, but it doesn't do everything.

Rails will install gems for you but it won't install PostgreSQL, Redis, or any other dependencies that you need on your machine but which **don't come in a gem**. You have to manually install those dependencies yourself. And those manual installations can be a pain.

This is the problem that Instant Rails solves. **Instant Rails eliminates the need to manually install your development environment's dependencies.**

How does it do this?

When you create a new project using Instant Rails, you get a small **Docker configuration file** inside your project. If you're not familiar with Docker, don't be scared off. You do NOT need to understand Docker in order to use Instant Rails.

All the Docker configuration file does is says "Hey, instead of using a database on the local machine, we want use _this_ Dockerized database instead."

You're free to ignore the fact that the database is Dockerized. You can use your Dockerized database just like a "normal" database.

The only difference you'll notice is that **you'll save a bunch of time and frustration by not having to manually install development dependencies**.

# How to use Instant Rails

## Prerequisites

In order to use Instant Rails, you must have Docker, Ruby and the `rails` gem installed.

## Usage instructions

First clone the repo.

```bash
git clone https://github.com/jasonswett/instant_rails.git
cd instant_rails
```

Then run the `init.sh` script.

```bash
./init.sh your_app_name
```

This script will create a Rails application for you. Once the script finishes, you can `cd` into the project directory, run `rails server` and see your app running.

# Get help

To get help, just open an issue or email me at jason@codewithjason.com.

# Acknowledgements

This project was inspired in part by the late Mike Rogers' [Docker/Rails template](https://github.com/Ruby-Starter-Kits/Docker-Rails-Template).
