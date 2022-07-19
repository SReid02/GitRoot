#Function for creating google searchs

Function search-google {
        #Setting query variable with basic google search URL
        $query = 'https://www.google.com/search?q='
        #% is an alias for "ForEachobject"
        $args | ForEach-Object { $query = $query + "$_+" }
        # -1 removes the + sign at the end
        $url = $query.Substring(0, $query.Length -1)
        # start is used to open defult web browser
        start "$url"
}
#uses default web browser to run above funtion. Afterwards it navigates to google then you choose your search paramaters inbetween ** after serach-google command
search-google *powershell meaning before {}*