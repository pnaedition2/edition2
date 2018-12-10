
$endpoint="endpoint ip"

function encodestring($value)
{

$url="http://"+$endpoint+"/encode"

$payload = @{
      encode=$value
   }
   $body = (ConvertTo-Json $payload)
   $returnval=Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType 'application/json'
   return $returnval.encoded
}
  
function decodestring($value)
{

$url="http://"+$endpoint+"/decode"

$payload = @{
      decode=$value
   }
   
   $body = (ConvertTo-Json $payload)
   $returnval=Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType 'application/json'
   Write-Host $returnval
}

$encodedstring=encodestring 'abhishek[:]password'

Write-Host ($encodedstring)
decodestring $encodedstring
