#NoEnv  
#SingleInstance force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir% 

#Include WatchFolder.ahk ; Must be in the same folder as the script.
SetBatchLines, -1

IfNotExist, savedpath.txt ; check if we have the recording path from the user. If not, asking for it.
{
	InputBox, recPath, OBSVO, Please enter your obs recording path
	Switch ErrorLevel
	{
		case 0:
		FileAppend, %recPath%, savedpath.txt
		case 1:
		ExitApp
	}	
}

FileRead, recPath, savedpath.txt ; getting the saved path from the text file.

WatchFolder(recPath, "folderFunc") 

folderFunc(Directory, Changes)
{ 
	For Each, Change In Changes
	{
       action := change.action
       pathName := change.name
	   ; -------------------------------------------------------------------------------------------------------------------------
	   If (Action = 1)
		{	
			; Getting the current window title to use it as a prefix instead of the obs one.
			WinGetTitle, title, A 
			
			; Making sure that the title doesn't contain whitespaces, this caused trouble in some titles.
			StringReplace, titleNoWhiteSpaces, title, %A_Space%,,All 
			
			; a list of character that a file name cannot contain (some titles might have one of them)
			forbidWin := "\,/,:,*,?,"",<,>,|"
							
			; Getting the video name only from the whole pathName variable.
			SplitPath, pathName, videoFileName
			
			; Getting the video directory from the whole pathName variable. 
			SplitPath, pathName,, videoDir
			
			;Removing any forbidden chars from the title if presence.		
			Loop, parse, forbidWin, `,
			{
				if titleNoWhiteSpaces contains % A_LoopField 				
				{
					StringReplace, titleNoWhiteSpaces, titleNoWhiteSpaces, % A_LoopField,_,All	
				}
			}
			
			if videoFileName contains Replay
			{		
				; Replacing the old video prefix with the current active title.
				StringReplace, gameFileName, videoFileName, Replay, %titleNoWhiteSpaces% ; If you have a prefix other than (Replay) in obs you should change it here.
				
				; Checking if theres already a folder with the current active window title, if not creating one.
				IfNotExist, %videoDir%\%titleNoWhiteSpaces%
				{
					FileCreateDir, %videoDir%\%titleNoWhiteSpaces%
				}
				sleep, 2500
				; Moving the video to the folder and replacing the old prefix with the current active window title.
				FileMove, %pathName%, %videoDir%\%titleNoWhiteSpaces%\%gameFileName%, 1
				SoundPlay, %A_ScriptDir%\Notification.mp3				
			}
		}
	}
}

