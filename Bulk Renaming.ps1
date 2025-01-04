# PowerShell script to bulk rename all the files inside a folder
# To remove a particular characters from all files, paste the string in "Find" variable and keep "ReplaceWith" section blank and Vice versa.
# Author : Anshul Agrawal


#The Folder Path
$path = 'I:\Moviies'

#Input Find and Replace keywords
$Find = 'www.moviejockey.com'
$replace = ""

#If Replace operation to be performed
$ifReplace = $true


#Loop through all the files in a For Loop
$SearchPath = Get-ChildItem -Path $path -Recurse | Where-Object {! $_.PSIsContainer}
Foreach($file in $SearchPath){
    #If Keyword is Found, Replace it with the keywords and rename the file
    if($file.name.Contains($Find))
    {
        $newName = $file.Name.Replace(([regex]::Escape($Find)),$replace)
        Write-Host "Found: $($File.FullName)"
        $filePath = $File.FullName
        #$filePath = Join-Path -path $file.Directory.FullName -ChildPath $File.Name
        #$newpath = Join-Path -Path $file.DirectoryName -ChildPath $newName
        if($ifReplace){
            try{
                if(Test-Path $filePath) 
                {
                    write-host "Renaming $filePath to: $newName"
                    Rename-Item $filePath $newName -Force
                    Write-Host "Sucessfully Renamed! $newName"
                    Write-Host "*******************************************"
                }
                else
                {
                    Write-Host "Failed renaming $newname : $error"
                    Write-Host "*******************************************"
                }
               }
            catch{
                Write-Host "Error renaming '$($file.Name)': $_"            
                }
            $newName = $null
        }
    }
    #Else Continue
    }
#End

$filepath = $path + '\text.txt'
$filepath = $null

