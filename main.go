package main

import (
	maxprofit "FolcaTechTechnicalTestSolve/maxProfit"
	shiftarray "FolcaTechTechnicalTestSolve/shiftArray"
	"fmt"
)

func main() {
	//No 1 Max Profit
	fmt.Println(maxprofit.MaxProfit([]int{4, 11, 2, 20, 59, 80}, 2)) //output: 85

	//No 2 Shift Array
	fmt.Println(shiftarray.ShiftArray([]int{1, 2, 3, 4, 5, 6, 7, 8, 9}, 1))  // [4,1,2,7,5,3,8,9,6]
	fmt.Println(shiftarray.ShiftArray([]int{1, 2, 3, 4, 5, 6, 7, 8, 9}, 2))  // [7,4,1,8,5,2,9,6,3]
	fmt.Println(shiftarray.ShiftArray([]int{1, 2, 3, 4, 5, 6, 7, 8, 9}, -1)) // [2,3,6,1,5,9,4,7,8]
}
