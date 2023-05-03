CREATE TABLE "customers"(
    "customer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "ticket_id" INTEGER NOT NULL,
    "items_purchased" INTEGER ,
    "total_spent" DECIMAL(8, 2) ,
    "concessions_id" INTEGER 
);
ALTER TABLE
    "customers" ADD PRIMARY KEY("customer_id");
CREATE TABLE "tickets"(
    "ticket_id" SERIAL NOT NULL,
    "ticket_number" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "theater_room" INTEGER NOT NULL,
    "time_of_purchase" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "move_title" CHAR(255) NOT NULL,
    "show_time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "movie_id" SERIAL NOT NULL
);
ALTER TABLE
    "tickets" ADD PRIMARY KEY("ticket_id");
CREATE TABLE "movies"(
    "movie_id" SERIAL NOT NULL,
    "movie_title" CHAR(255) NOT NULL,
    "show_time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "rating" CHAR(255) NOT NULL,
    "movie_duration" TIME(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "movies" ADD PRIMARY KEY("movie_id");
CREATE TABLE "concessions"(
    "concessions_id" SERIAL NOT NULL,
    "item_name" CHAR(255) NULL,
    "price" DECIMAL(8, 2) NULL,
    "quantity" INTEGER NULL
);
ALTER TABLE
    "concessions" ADD PRIMARY KEY("concessions_id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_concessions_id_foreign" FOREIGN KEY("concessions_id") REFERENCES "concessions"("concessions_id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_movie_id_foreign" FOREIGN KEY("movie_id") REFERENCES "movies"("movie_id");
    

SELECT * FROM tickets;