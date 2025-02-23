package database

import (
    "database/sql"
    "embed"

    "github.com/pressly/goose/v3"
    _ "github.com/mattn/go-sqlite3"
)

//go:embed schema/*.sql
var migrationFS embed.FS

func Migrate(db *sql.DB) error {
    goose.SetBaseFS(migrationFS)
    if err := goose.SetDialect("sqlite3"); err != nil {
        return err
    }
    return goose.Up(db, ".") 
}
