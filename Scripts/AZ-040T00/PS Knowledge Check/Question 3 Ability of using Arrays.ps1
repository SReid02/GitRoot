#Q3.1 Write a function that will take an array of integers and will return the value of the smallest and largest added together

function add-smalltolarge {
    param (
        [Int32[]]$NumberArray  
           
    )
    $LargestNo = Measure-Object -Maximum
    $SmallestNo = Measure-Object -Maximum
    Return $LargestNo + $SmallestNo
    
}

add-smalltolarge -NumberArray '241,123,667,134,7890,12,3'