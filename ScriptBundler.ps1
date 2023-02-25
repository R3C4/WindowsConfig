
#Get Items of Folder
$Folder = Get-ChildItem -Path "\scripts"

#Create a List
$List = @()

#Add Items to List
foreach($Item in $Folder){
    $List += $Item.Name
}

# Create Content List
$Contents = @()

# Get content of file
foreach($Item in $List){
    $Content = Get-Content -Path "\scripts\$Item"
    $Contents += $Content
}

# Loop in $Contents List and Create Function by Name of File and add content of file to function


# Create a new file
New-Item -Path "" -ItemType File -Value $Contents