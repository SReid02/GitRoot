#Q1.2 Create a function that takes a three word sentence as a string parameter and only return th middle word
#For this challenge use the methods .IndexOf() to find the location of the spaces and .Substring() to extract the middle word



function find-middleword { #we create the function find middle word
        Param ( #creating the param $newstring are my 3 words as a string
            [string]$NewString = 'Fus Roh Dah' #4,8
        )
            $middle = $NewString.indexof(' ') +1
            $NewString2 = $NewString.IndexOf(' ',$middle)
            $middlewordlength = $NewString2 - $middle
            
            
            
}



            $middleword = $NewString.Substring(4,) 
      
      
  #Class solution
  
  function Find-MiddleWord {
  Param ([string]$Sentence = 'Three Blind Mice' )
    
  $IndexMidWord = $Sentence.IndexOf(' ') + 1
  $IndexEndMidWord = $Sentence.IndexOf(' ',$IndexMidWord)
  $WordLength = $IndexEndMidWord - $IndexMidWord
  $MiddleWord = $Sentence.Substring($IndexMidWord,$WordLength)
  Return $MiddleWord
}
  Find-MiddleWord -Sentence "Three Blind Mice"          



