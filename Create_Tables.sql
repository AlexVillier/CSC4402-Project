CREATE TABLE Games(
    id        int,
    name        varchar(255),
    platform_id    int,
    PRIMARY KEY (id),
    FOREIGN KEY (platform_id) REFERENCES Platforms(id)
);
ALTER TABLE Games ADD release_year int;

CREATE TABLE Platforms(
    id        int,
    name        varchar(255),
    year_started    int,
    PRIMARY KEY (id)
);

CREATE TABLE Users(
    id        int,
    name        varchar(255),
    steam_name    varchar(255),
    origin_name    varchar(255),
    epic_name    varchar(255),
    xbox_name    varchar(255),
    psn_name    varchar(255),
    PRIMARY KEY (id)
);
ALTER TABLE Users DROP COLUMN steam_name;
ALTER TABLE Users DROP COLUMN origin_name;
ALTER TABLE Users DROP COLUMN epic_name;
ALTER TABLE Users DROP COLUMN xbox_name;
ALTER TABLE Users DROP COLUMN psn_name;
ALTER TABLE Users ADD platform_name varchar(255);
ALTER TABLE Users ADD platform_id int;
ALTER TABLE Users ADD FOREIGN KEY (platform_id) REFERENCES Platforms(id);

CREATE TABLE Statistics(
    id        int,
    user_id    int,
    game_id    int,
    statistic_type    varchar(255),
    statistic_value    varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
FOREIGN KEY (game_id) REFERENCES Games(id)
);
