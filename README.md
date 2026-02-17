# 🏸 Badminton League Manager

A Ruby on Rails application designed to manage and track a badminton
league efficiently.

This project emphasizes:

-   Clean architecture
-   Proper data modeling
-   Production-ready backend design
-   Data integrity and scalability

------------------------------------------------------------------------

## Tech Stack

-   Ruby 3.2
-   Rails 7.1
-   PostgreSQL
-   HTML / CSS (minimal UI styling)

------------------------------------------------------------------------

## Features

### Player Management

-   Add new players
-   Remove players (with dependency protection)
-   Enforce unique player names (case-insensitive validation + DB
    constraint)

------------------------------------------------------------------------

### Match Tracking

-   Record match results (winner & loser)
-   Validation to prevent selecting the same player as both winner and
    loser
-   Database-level integrity constraints
-   Transactional match creation for data consistency

------------------------------------------------------------------------

### Leaderboard

Displays:

-   Rank
-   Wins
-   Losses
-   Win Percentage

Sorting:

-   Ordered by most wins

Implementation highlights:

-   Efficient SQL query
-   Eager loading to prevent N+1 issues

------------------------------------------------------------------------

## Architecture Overview

app/
    models/
        player.rb
        match.rb

services/
    matches/create_match.rb

queries/
    leaderboard_query.rb

controllers/
    players_controller.rb
    matches_controller.rb
    leaderboard_controller.rb

views/\
    players/
    matches/
    leaderboard/
    layouts/
        application.html.erb
        _navbar.html.erb
        _flash.html.erb

------------------------------------------------------------------------

## Design Decisions

### Service Object --- Matches::CreateMatch

Encapsulates match creation logic.

**Benefits:**

-   Ensures transactional safety
-   Keeps controllers thin
-   Easy to extend (e.g., scoring system, ELO ranking)
-   Improves testability

------------------------------------------------------------------------

### Database-Level Safety

To guarantee data integrity even if Rails validations are bypassed:

-   Foreign key constraints
-   Check constraint preventing winner_id == loser_id
-   Unique index on player names (case-insensitive)
-   Optional counter cache columns for scalability

------------------------------------------------------------------------

### Query Object --- LeaderboardQuery

Leaderboard ranking logic is extracted into a dedicated query object.

**Advantages:**

-   Keeps SQL out of controllers
-   Encapsulates ranking logic
-   Improves separation of concerns
-   Easily extendable for advanced ranking logic
-   Can integrate decorators for player statistics

------------------------------------------------------------------------

### Transactions

Uses:

ActiveRecord::Base.transaction

Ensures:

-   Atomicity
-   Consistency
-   Reliable multi-step database operations

------------------------------------------------------------------------

## Setup Instructions

### Clone the Repository

git clone git@github.com:ankur-kumar5/badminton.git
cd badminton

### Install Dependencies

bundle install

### Setup Database

rails db:create
rails db:migrate

### Run the Server

rails s

Visit:

http://localhost:3000

------------------------------------------------------------------------

## Running Tests

rspec
