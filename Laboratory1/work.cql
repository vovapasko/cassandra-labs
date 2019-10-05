
insert into labwork1.player(player_id, player_balance, player_name, player_password)
values(1, 1000, {"firstname": 'Vasya', "surname": 'Pupkin', "nickname": 'Vapupa'}, 'passwordVasya');
insert into labwork1.player(player_id, player_balance, player_name, player_password)
values(2, 2000, {"firstname": 'Pasha', "surname": 'Zopin', "nickname": 'PAZo'}, 'passwordPasha');
insert into labwork1.player(player_id, player_balance, player_name, player_password)
values(3, 3000, {"firstname": 'Vasya', "surname": 'Vaskin', "nickname": 'Vava'}, 'passwordVasya');

select * from labwork1.player;

insert into labwork1.bank(client_id, account_id, money_for_game, sold_money, sold_time)
values(1, 101, 'Roulette', 1000, 1570136634);
insert into labwork1.bank(client_id, account_id, money_for_game, sold_money, sold_time)
values(1, 102, 'Roulette', 2000, 1570136975);
insert into labwork1.bank(client_id, account_id, money_for_game, sold_money, sold_time)
values(3, 102, 'Roulette', 3000, 1570136334);

select * from labwork1.bank;

insert into labwork1.casino(player_id, bet, game_played)
values(1, [{"bet_id": 'b01', "bet_money":20.5, "won_money": 2050, "won_bet": false, "bet_time": 1570136975},
	{"bet_id": 'b02', "bet_money":40.5, "won_money": 120, "won_bet": false, "bet_time": 1570138888},
	{"bet_id": 'b03', "bet_money":15, "won_money": 35.4, "won_bet": true, "bet_time": 1570139999}
], 'Roulette');
insert into labwork1.casino(player_id, bet, game_played)
values(2, [{"bet_id": 'b11', "bet_money":20.5, "won_money": 2050, "won_bet": false, "bet_time": 1570136975},
	{"bet_id": 'b12', "bet_money":40.5, "won_money": 120, "won_bet": false, "bet_time": 1570138888}], 'Roulette');
insert into labwork1.casino(player_id, bet, game_played)
values(3, [{"bet_id": 'b21', "bet_money":20.5, "won_money": 2050, "won_bet": false, "bet_time": 1570136975}], 'Roulette');

select json* from labwork1.casino;


update labwork1.player set "player_name" = {"firstname": 'Vasyliy', "surname": 'Ivanov', "nickname": 'MarriedVasyliy1029'}
where player_id = 1;
select json* from labwork1.player where player_id = 1;

update labwork1.bank set money_for_game = 'Poker'
where client_id = 1;
select * from labwork1.bank;

update labwork1.casino set game_played = 'Poker'
where player_id = 1;
select * from labwork1.casino;


select player_id, bet from labwork1.casino
where player_id = 1;

select player_id, bet from labwork1.casino
where player_id = 1;

select account_id, money_for_game, sold_money from labwork1.bank
where client_id = 1;

select account_id, money_for_game, sold_money, sold_time  from labwork1.bank
where client_id = 1;


delete game_played 
from labwork1.casino
where player_id = 3;
select * from labwork1.casino;


select * from labwork1.bank;
delete sold_money from labwork1.bank 
where account_id = 102 and 
client_id = 1;
select * from labwork1.bank;


delete player_password from labwork1.player 
where player_id = 1;
select * from labwork1.player;
