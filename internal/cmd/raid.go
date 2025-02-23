package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"os"
)

var configFile string

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "raider",
	Short: "Raider is a CLI adventure game where players gear up to raid a randomized dungeon",
	Long: `Raider is a text-based, CLI adventure game where players gear up a solo character 
and send them on randomized dungeon raids. Designed for short gameplay sessions aligned with pomodoro 
timers, Raider is perfect for quick mental breaks during the workday or study sessions. `,
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {}
