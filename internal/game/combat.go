package game

type CombatEntity struct {
	Name string
	Health float64
	Speed int
	Damage float64
}

type CombatResults struct {
	PlayerDamage float64
	EnemyDamage float64
	UpdatedWinnerStats CombatEntity
}

func Fight(player, enemy CombatEntity) CombatResults {
	speedDiff := float64(player.Speed - enemy.Speed)
	
	playerTrueDamage := player.Damage + (player.Damage * (0.1 * speedDiff))

	hitsToKillPlayer := player.Health / enemy.Damage
	hitsToKillEnemy := enemy.Health / playerTrueDamage

	if hitsToKillPlayer > hitsToKillEnemy {
		return CombatResults{
			PlayerDamage: playerTrueDamage * hitsToKillEnemy,
			EnemyDamage: enemy.Damage * hitsToKillEnemy,
			UpdatedWinnerStats: CombatEntity{
				Name: player.Name,
				Health: player.Health - (enemy.Damage * hitsToKillEnemy),
				Speed: player.Speed,
				Damage: player.Damage,
			},
		}
	} else {	
		return CombatResults{
			PlayerDamage: playerTrueDamage * hitsToKillPlayer,
			EnemyDamage: enemy.Damage * hitsToKillPlayer,
			UpdatedWinnerStats: CombatEntity{
				Name: enemy.Name,
				Health: enemy.Health - (playerTrueDamage * hitsToKillPlayer),
				Speed: enemy.Speed,
				Damage: enemy.Damage,
			},
		}
	}
}
