# README

# Rails-Todo
A simple Ruby on Rails TODO application for a single user.
It allows creating tasks, setting priorities and deadlines, and updating their status (wait, doing, or done).

## Ruby version
- Ruby 3.4.2

## System dependencies
- Rails 8.0.2
- SQLite3

## Configuration
- No special configuration needed for single-user setup

## Database creation
```bash
rails db:create
rails db:migrate
rails db:seed
```

## Database initialization
- `db:migrate` will create the tables defined in migrations
- `db:seed` will populate initial sample tasks if needed

## How to run the test suite
```bash
rails test
```

## Services
- None required for this basic TODO app

## Deployment instructions
Example using Heroku:
```bash
git push heroku main
heroku run rails db:migrate
```

## Database Schema
### settings table
- default_deadline_days (integer) - default number of days for task deadlines
- default_deadline_hours (integer) - default number of hours for task deadlines
- default_deadline_minutes (integer) - default number of minutes for task deadlines
- created_at (datetime)
- updated_at (datetime)

### todos table
- id (integer, primary key)
- task (text) - task description
- priority (integer) - task priority
- deadline (datetime) - task deadline
- status (integer, default: 0, not null) - task status (`wait=0`, `doing=1`, `done=2`)
- created_at (datetime)
- updated_at (datetime)
