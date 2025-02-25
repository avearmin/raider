package game

import (
	"reflect"
	"testing"
)

func TestFight(t *testing.T) {
	tests := []struct {
		name string
		player CombatEntity
		enemy CombatEntity
		expect CombatResults
	} {
		{
			name: "player win",
			player: CombatEntity{
				Name: "player",
				Health: 20,
				Speed: 5,
				Damage: 10,
			},
			enemy: CombatEntity{
				Name: "enemy",
				Health: 10,
				Speed: 5,
				Damage: 10,
			},
			expect: CombatResults{
				PlayerDamage: 10,
				EnemyDamage: 10,
				UpdatedWinnerStats: CombatEntity{
					Name: "player",
					Health: 10,
					Speed: 5,
					Damage: 10,
				},
			},
		},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			if results := Fight(test.player, test.enemy); !reflect.DeepEqual(results, test.expect) {
				t.Fatalf("FAIL %s\ngot: %v\nexpect: %v", test.name, results, test.expect)
			}
		})
	}
}
