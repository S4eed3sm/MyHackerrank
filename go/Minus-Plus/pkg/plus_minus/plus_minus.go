package plus_minus

import "fmt"



func PlusMinus(arr []int32) {
	colors := []int32{0, 0, 0}
	for _, i := range arr {
		if i > 0 {
			colors[0]++
		} else if i < 0 {
			colors[1]++
		} else {
			colors[2]++
		}
	}
	for _, v := range colors {
		fmt.Printf("%.06f\n", float32(v)/float32(len(arr)))
	}
}
