extends Node

func prisoner_dilemma(_my_stance, _enemy_stance):
	if _my_stance == 0:
		if _enemy_stance == 0:
			return 2
		else:
			return 0
	else:
		if _enemy_stance == 0:
			return 5
		else:
			return 1
