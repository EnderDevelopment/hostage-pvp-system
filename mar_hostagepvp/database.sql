CREATE TABLE IF NOT EXISTS hostage_pvp_players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    team VARCHAR(20) NOT NULL,
    kills INT DEFAULT 0,
    deaths INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(id)
);

CREATE TABLE IF NOT EXISTS hostage_pvp_events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(50) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    winner VARCHAR(20)
);