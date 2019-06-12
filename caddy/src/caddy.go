package main

import (
	"github.com/mholt/caddy/caddy/caddymain"

	_ "github.com/pyed/ipfilter"
	// _ "github.com/hacdias/caddy-webdav"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
