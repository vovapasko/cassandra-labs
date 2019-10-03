CREATE KEYSPACE IF NOT EXISTS labwork1 WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': '3'
};
Create Type if not exists labwork1.user_name_type(
	firstname text,
	surname text,
	nickname text 
);

CREATE TABLE IF NOT EXISTS labwork1.player(
	player_id int,
	player_balance int, 
	player_name frozen<user_name_type>,
	Primary key(player_id)
);

CREATE TABLE IF NOT EXISTS labwork1.bank(
	client_id int,
	account_id int,
	money_for_game text Static,
	sold_money double,
	sold_time timestamp,
	Primary key((client_id), account_id)
);

CREATE TYPE IF NOT EXISTS labwork1.bet(
	bet_id text,
	bet_money double,
	won_money double,
	won_bet boolean,
	bet_time timestamp
);

CREATE TABLE IF NOT EXISTS labwork1.casino(
	player_id int,
	game_played text,
	bet LIST<frozen<bet>>,
	primary key(player_id)
);

