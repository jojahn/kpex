package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"strings"
)

func extractNameFromBody(body string) string {
	var result map[string]interface{}
	if err := json.Unmarshal([]byte(body), &result); err != nil {
		return "World"
	}
	return result["name"].(string)
}

func processName(name string) ([]byte, error) {
	result := make(map[string]interface{})
	result["msg"] = fmt.Sprintf("Hello, %+v!", name)
	return json.Marshal(result)
}

func main() {
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		response, err := processName(extractNameFromBody(readerToString(r.Body)))
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(response)
	})

	log.Println("Starting Simple HTTP server on http://localhost:8090/hello ...")

	log.Fatal(http.ListenAndServe(":8090", nil))
}

func readerToString(reader io.Reader) string {
	buf := new(strings.Builder)
	if _, err := io.Copy(buf, reader); err != nil {
		return ""
	}
	return buf.String()
}
