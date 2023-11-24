DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE "leagues" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "start_date" DATE NOT NULL,
  "end_date" DATE NOT NULL
);

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "league_id" INT REFERENCES leagues.id
);

CREATE TABLE "players" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT UNIQUE NOT NULL,
  "team_id" INT REFERENCES teams.id
);

CREATE TABLE "referees" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "matches" (
  "id" SERIAL PRIMARY KEY,
  "team_one_id" INT REFERENCES teams.id,
  "team_two_id" INT REFERENCES teams.id,
  "main_ref_id" INT REFERENCES referees.id,
  "ast_ref_1_id" INT REFERENCES referees.id,
  "ast_ref_2_id" INT REFERENCES referees.id
);

CREATE TABLE "goals" (
  "id" SERIAL PRIMARY KEY,
  "scored_by_id" INT REFERENCES players.id,
  "match_id" INT REFERENCES matches.id
);

CREATE INDEX idx_leagues_name
    ON leagues("name");

CREATE INDEX idx_teams_name
    ON teams("name");

CREATE INDEX idx_teams_leagues_id
    ON teams("league_id");

CREATE INDEX idx_matches_team_one_id 
    ON matches ("team_one_id");

CREATE INDEX idx_matches_team_two_id 
    ON matches ("team_two_id");

CREATE INDEX idx_goals_scored_by_id 
    ON goals ("scored_by_id");

CREATE INDEX idx_goals_match_id 
    ON goals ("match_id");