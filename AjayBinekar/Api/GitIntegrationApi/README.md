# GitHub Integration Rails Application

## Introduction
This Rails application integrates with the GitHub API to retrieve repositories and their commit messages.

## Prerequisites
- Ruby version 3.2.2
- SQLite3 database
- GitHub account with an access token

## Installation:
```bash
git clone https://github.com/Shadbox-Infosystem/PresentationProject.git
```

## Added Gem
- `gem 'dotenv-rails'` : Autoload dotenv in Rails.
- `gem 'octokit'` : Simple wrapper for the GitHub API

## Install dependencies:
```bash
bundle install
```

## Setup .env
Set up environment variables:
Create a `.env` file in the root directory and add your GitHub access token:
```dotenv
GITHUB_ACCESS_TOKEN=your_access_token_here
GITHUB_USERNAME=your_github_username_here
```

## Running the Application
Start the Rails server:
```bash
rails server 
```

## Endpoint
- GET [http://localhost:3000/api/v1/repositories](http://localhost:3000/api/v1/repositories) : Returns a JSON array of repositories owned by the specified GitHub user.
- GET [http://localhost:3000/api/v1/commits?repo_name=ajaybinekar/Smart_Crop](http://localhost:3000/api/v1/commits?repo_name=ajaybinekar/Smart_Crop) : Returns a JSON array of commit messages for the specified repository.

## Video Demo
[Watch the video demo](https://www.youtube.com/embed/4ojwm0zSojM?si=KZ3BYLMiFbOGTAs_)
```

