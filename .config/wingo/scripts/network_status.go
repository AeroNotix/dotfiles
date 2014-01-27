package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
	"time"
)

func ReadNetworkStat(file string) int64 {
	f, err := os.Open(file)
	if err != nil {
		return 0
	}
	b, err := ioutil.ReadAll(f)
	if err != nil {
		return 0
	}
	i, err := strconv.ParseInt(strings.TrimRight(string(b), "\n"), 10, 32)
	if err != nil {
		return 0
	}
	return i
}

func main() {
	tx := ReadNetworkStat("/sys/class/net/wlp3s0/statistics/tx_bytes")
	rx := ReadNetworkStat("/sys/class/net/wlp3s0/statistics/rx_bytes")
	orig := rx + tx
	for {
		tx := ReadNetworkStat("/sys/class/net/wlp3s0/statistics/tx_bytes")
		rx := ReadNetworkStat("/sys/class/net/wlp3s0/statistics/rx_bytes")
		fmt.Println(((rx + tx) - orig) / 1024)
		orig = rx + tx
		time.Sleep(1 * time.Second)
	}
}
