SELECT 
	RANK() OVER(ORDER BY team.team_best_score DESC, team.team_medium_score DESC, team.team_worst_score DESC) AS general_rank,
	team.team_id, 
	team.team_score_1, 
	team.team_score_2, 
	team.team_score_3
FROM team;

general_rank;team_id;team_score_1;team_score_2;team_score_3
1;133;200;200;320
2;131;100;200;300
3;132;100;200;200
4;134;200;100;100
4;135;200;100;100
6;136;50;50;80
7;149;-1;-1;-1
7;160;-1;-1;-1
7;150;-1;-1;-1
