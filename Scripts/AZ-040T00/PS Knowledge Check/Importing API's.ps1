$SwarsPers5 = Invoke-WebRequest -uri "https://swapi.dev/api/people/5/"
$SwarsPers5.Content |ConvertFrom-Json