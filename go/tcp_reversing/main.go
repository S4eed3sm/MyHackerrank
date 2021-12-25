package main

import (
	"bufio"
	"fmt"
	"io"
	"net"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the 'TCPServer' function below.
 *
 * The function accepts chan bool ready as a parameter.
 */
func Reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func TCPServer(ready chan bool) {
	l, err := net.Listen("tcp", address)
	if err != nil {
		fmt.Println("Error listening:", err.Error())
		os.Exit(1)
	}
	defer l.Close()
	ready <- true
	for true {
		conn, err := l.Accept()
		if err != nil {
			fmt.Println("Error accepting: ", err.Error())
			os.Exit(1)
		}
		buf := make([]byte, maxBufferSize)
		n, err := conn.Read(buf)
		// fmt.Printf("buf = %s\n", string(buf))
		if err != nil {
			fmt.Println("Error read: ", err.Error())
			os.Exit(1)
		}
		// fmt.Printf("revers = %v\n", Reverse(string(buf)))
		conn.Write([]byte(Reverse(string(buf[:n]))))
	}
}

const maxBufferSize = 1024
const address = "127.0.0.1:3333"

func main() {
	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)
	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	messagesCount, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)

	var messages []string

	for i := 0; i < int(messagesCount); i++ {
		messagesItem := readLine(reader)
		messages = append(messages, messagesItem)
	}

	ready := make(chan bool)
	go TCPServer(ready)
	<-ready
	reversed, err := tcpClient(messages)
	if err != nil {
		panic(err)
	}
	for _, msg := range reversed {
		// fmt.Printf("msg=%v\n", msg)
		fmt.Fprintf(writer, "%s\n", msg)
	}
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

func tcpClient(messages []string) ([]string, error) {
	tcpAddr, err := net.ResolveTCPAddr("tcp", address)
	if err != nil {
		return []string{}, err
	}

	reversed := []string{}

	for _, msg := range messages {

		conn, err := net.DialTCP("tcp", nil, tcpAddr)
		if err != nil {
			return []string{}, err
		}
		_, err = conn.Write([]byte(msg))
		if err != nil {
			return []string{}, err
		}

		reply := make([]byte, maxBufferSize)

		n, err := conn.Read(reply)
		if err != nil {
			return []string{}, err
		}
		// fmt.Printf("reply=%v\n", string(reply))
		reversed = append(reversed, string(reply[:n]))
		conn.Close()
	}

	return reversed, nil
}
