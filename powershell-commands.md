# Delete branches containing a certain word
This is not just powershell but also uses the grep and tr unix commands. 
Delete all branches that contain a certain word: 

@(git branch | grep "SOMETHING" | tr.exe -d " ") | %{git branch -d $_}
