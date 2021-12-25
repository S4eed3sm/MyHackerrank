package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s string) string {
	// Write your code here
	l := len(s)
	am_pm := s[l-2 : l]
	fmt.Printf("am_pm=%v\n", am_pm)
	parts := strings.Split(s[0:l-2], ":")
	hh, _ := strconv.ParseInt(parts[0], 10, 64)
	hh %= 12
	if am_pm == "PM" {
		hh += 12
	}
	parts[0] = fmt.Sprintf("%02d", hh)
	fmt.Println(strings.Join(parts, ":"))
	return strings.Join(parts, ":")
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	s := readLine(reader)

	result := timeConversion(s)

	fmt.Fprintf(writer, "%s\n", result)

	writer.Flush()
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
