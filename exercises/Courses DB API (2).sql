CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "role" varchar NOT NULL,
  "roles_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "user_id" uuid NOT NULL,
  "crs_categories_id" uuid NOT NULL
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "progress" integer NOT NULL,
  "review" text NOT NULL,
  "user_id" uuid NOT NULL,
  "courses_id" uuid NOT NULL
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "crs_categories_id" uuid NOT NULL
);

CREATE TABLE "course_categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

--En esta tabla la imaginé pasandole uuid's para que pudiera enviarnos a la info de C/U y poder ver su info - no lo he conseguido 'aun'.
CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "student" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "admin" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("crs_categories_id") REFERENCES "course_categories" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("crs_categories_id") REFERENCES "course_categories" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");
