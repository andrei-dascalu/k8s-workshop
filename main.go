package main

import (
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func main() {
	app := fiber.New(fiber.Config{
		DisableStartupMessage: true,
	})

	SetupLogger()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.JSON(map[string]string{
			"message": "Hello, World 👋!",
		})
	})

	app.Get("/env", func(c *fiber.Ctx) error {
		hostName, err := os.Hostname()

		if err != nil {
			hostName = "error"
		}

		return c.JSON(map[string]string{
			"version":  os.Getenv("APP_VERSION"),
			"env":      os.Getenv("FROM_DEPLOYMENT"),
			"hostname": hostName,
		})
	})

	app.Listen(":8080")
}

func SetupLogger() {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnixMicro

	log.Warn().Msg("Logger Started")
}
