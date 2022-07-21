#Q3.1 Write a function that will take an array of integers and will return the value of the smallest and largest added together

#currently using a switch wrong. I am Trying to get the largest number from any given int array to add onto smallest number.
#referenced https://devblogs.microsoft.com/scripting/powertip-find-the-largest-number-in-a-powershell-array/ to get min and max switch
#Concluded measure object is wrong command

function add-smalltolarge {
    param (
        [Int[]]$NumberArray) 
        $LargestNo = $NumberArray | Measure-Object -Maximum 
        $SmallestNo = $NumberArray | Measure-Object -Minimum 
    Return $LargestNo.Maximum + $SmallestNo.Minimum
    
}
add-smalltolarge -NumberArray 241,123,667,134,7890,12,3


#Q3.2 Create a function that takes a word as a parameter and returns the count of vowels and the count of consonants

function Letter-Count {
    param ([String]$WordLetterCount)
        $vowel = 'a','e','i','o','u' 
        $Consontant = 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z' 
        $WordLetterCount.ToCharArray()
        $vowelcount = $WordLetterCount | Where-Object {$_-EQ $_.$vowel} | Measure-Object -Sum
        $Consontantcount = $WordLetterCount | Where-Object {$_ -EQ $_.consontant} | Measure-Object -Sum

        Return $vowelcount.Count , $Consontantscount.Count
        
}
Letter-Count 'HappyTree'

#below is finding the methods to a string
'Happy' | Get-Member