# GraphQL Rails Application

## Introduction
This Rails application integrates with GraphQL to display data fetched from a SQLite3 database.

## Prerequisites
Before getting started, ensure you have the following installed:

- Ruby version 3.2.2
- SQLite3 database

## Installation

Clone the repository:

```bash
git clone https://github.com/Shadbox-Infosystem/PresentationProject.git
```

## Added Gems
The following gems have been added to the project:

- `gem 'graphiql-rails'`: GraphiQL interface for querying GraphQL endpoints.
- `gem 'graphql', '~> 2.3'`: GraphQL wrapper for interacting with the GitHub API.

Run the following commands to install dependencies and set up GraphQL:

```bash
bundle install
rails generate graphql:install
rails g graphql:object item
```

## Running the Application
Start the Rails server:

```bash
rails server 
```

After starting the server, access GraphiQL at [http://localhost:3000/graphiql](http://localhost:3000/graphiql) in your web browser. You can then execute queries to fetch data from the database. Here's an example query:

```graphql
{
  items {
    id
    title
    description
  }
}
```

## Video Demo
[Watch the video demo](https://www.youtube.com/embed/B6lUEhup_MM?si=-IBpIYtHfwrv_Fc5&start=7)
