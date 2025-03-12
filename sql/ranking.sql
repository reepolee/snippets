SELECT 
	team.team_name, 
	team.team_score_1, 
	team.team_score_2, 
	team.team_score_3,
	RANK() OVER(ORDER BY team.team_best_score DESC, team.team_medium_score DESC, team.team_worst_score DESC) AS general_rank
FROM team;
