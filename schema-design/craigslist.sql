CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(25) UNIQUE NOT NULL,
  "password" VARCHAR(25) NOT NULL,
  "pref_reg_id" INT REFERENCES regions.id
);

CREATE TABLE "regions" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "locations" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "region_id" INT REERENCES regions.id
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "user_id" INT REFERENCES users.id,
  "location_id" INT REFERENCES locations.id,
  "region_id" INT REFERENCES regions.id
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT
);

CREATE TABLE "categories_posts" (
  "id" SERIAL PRIMARY KEY,
  "post_id" INT REFERENCES posts.id,
  "category_id" INT REFERENCES categories.id
);

CREATE INDEX idx_posts_user_id 
    ON posts(user_id);

CREATE INDEX idx_posts_region_id 
    ON posts(region_id);
