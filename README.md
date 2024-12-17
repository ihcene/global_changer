# Global Changer Technical Test

This repository contains a technical test solution for the company Global Changer.

## Prerequisites

Make sure you have the following installed:
- Docker
- Docker Compose
- Ruby (3.1+)
- Bundler

## Installation

To avoid conflicts with other instances of Postgres, this project connects to different ports. PostgreSQL can be launched with the provided Docker Compose file.

1. **Install Ruby dependencies:**
    ```sh
    bundle install
    ```

2. **Start Docker containers:**
    ```sh
    docker-compose up
    ```

3. **Set up the database:**
    ```sh
    bin/rails db:setup
    ```

## Running the Server

Launch the server for local development:

```sh
bin/dev
```
