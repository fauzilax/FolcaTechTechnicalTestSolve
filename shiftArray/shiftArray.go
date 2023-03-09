package shiftarray

import "math"

func ShiftArray(array []int, i int) []int {
	//Write Your Code Here
	circle := []int{array[0], array[1], array[2], array[5], array[8], array[7], array[6], array[3]}
	if i == 0 {
		return array
	}
	if i < 0 {
		i = int(math.Abs(float64(i)))
		temp1 := circle[(0 + i):]
		temp2 := circle[:(0 + i)]
		tempRes := make([]int, len(temp1)+len(temp2))
		copy(tempRes, temp1)
		copy(tempRes[len(temp1):], temp2)
		result := []int{tempRes[0], tempRes[1], tempRes[2], tempRes[7], 5, tempRes[3], tempRes[6], tempRes[5], tempRes[4]}
		return result
	}

	temp1 := circle[((len(circle)) - i):]
	temp2 := circle[:(len(circle) - i)]
	tempRes := make([]int, len(temp1)+len(temp2))
	copy(tempRes, temp1)
	copy(tempRes[len(temp1):], temp2)
	result := []int{tempRes[0], tempRes[1], tempRes[2], tempRes[7], 5, tempRes[3], tempRes[6], tempRes[5], tempRes[4]}
	return result
	// fmt.Println(circle, tempRes)

}
