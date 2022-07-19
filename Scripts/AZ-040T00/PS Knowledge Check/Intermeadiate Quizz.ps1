#PowerShell Quiz
#1 Testing the use of methods
#Q1.1 Create a function that takes a string as a parameter and reverses the case, upper case changed to lower case and lower case changed to upper case


function Rev-Case {
            Param ([string]$RevText)
            [string] $newstring = ''
            foreach ($character in $RevText.ToCharArray()) {
                if ($character -cmatch '[a-z]') {
                    $newcharacter = $character.tostring().toupper()
            } 
            elseif ($character -cmatch '[A-Z]') {
                $newcharacter = $character.tostring().tolower()
            }
            else {
                $newcharacter = $character
            }            
            $newstring = $newstring + $newcharacter
            }
            Return $newstring
   
 }
 

Rev-Case -RevText 'y yOU sO hARD'