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
 * Complete the 'fizzBuzz' function below.
 *
 * The function accepts INTEGER n as parameter.
 */

func fizzBuzzI(i int32) {
	msg := ""

	if i%3 == 0 {
		msg += "Fizz"
	}
	if i%5 == 0 {
		msg += "Buzz"
	}
	if len(msg) == 0 {
		msg = fmt.Sprintf("%d", i)
	}
	fmt.Println(msg)
}

func fizzBuzz(n int32) {
	// Write your code here
	for i := int32(1); i <= n; i++ {
		fizzBuzzI(i)
	}
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	nTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)
	n := int32(nTemp)

	fizzBuzz(n)
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
