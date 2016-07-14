package main

import (
	"fmt"
	"net/http"

	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
)

func main() {
	goji.Get("/status", status)
	goji.Get("/echo/:phrase", echo)
	goji.Serve()
}

func status(c web.C, w http.ResponseWriter, r *http.Request) {

	fmt.Fprint(w, "{\"status\":\"ok\"}")

}

func echo(c web.C, w http.ResponseWriter, r *http.Request) {

	fmt.Fprintf(w, "{\"phrase\":\"%s\"}", c.URLParams["phrase"])

}
