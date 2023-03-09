package maxprofit

import (
	"math"
)

func MaxProfit(prices []int, i int) int {
	//Write Your Code Here
	if len(prices) == 0 || i == 0 {
		return 0
	}
	// n := len(prices)
	buy := make([]int, i)
	sell := make([]int, i)
	for j := 0; j < i; j++ {
		buy[j] = math.MinInt64
	}
	for _, price := range prices {
		for j := 0; j < i; j++ {
			if j == 0 {
				buy[j] = max(buy[j], -price)
			} else {
				buy[j] = max(buy[j], sell[j-1]-price)
			}
			sell[j] = max(sell[j], buy[j]+price)
		}
	}
	return sell[i-1]
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
