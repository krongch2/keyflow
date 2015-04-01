;;;;;;;;;;;;;;;;;;;;;;;;
;
; STDW_Functions.ahk
; By DAT, 09-04-2010
;
;  One of three scripts that make up 'Send to Dialog Window, Version 2' by DAT.
;  Contains functions that are used by the other two scripts.
;  For details and acknowledgements, please refer to STDW_Main.ahk.
;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
; Convert numeral to text
TextFromNumber(Number)
{
    IfEqual , Number , 2
        Return , "Two"
    IfEqual , Number , 3
        Return , "Three"
    IfEqual , Number , 4
        Return , "Four"
    IfEqual , Number , 5
        Return , "Five"
    Else
        Return , Number
}
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;
; Puts message in centre of dialog window, or if none, in centre of screen.
ShowMessage(Msg)
{
    Global f_window_id
    If f_window_id
    {
      WinGetPos ,  xloc, yloc , wloc, hloc, ahk_id %f_window_id%
      progw := 200
      progh := 100
      xloc := (xloc + wloc/2 - progw/2)     ;Calculate x coordinate of Progress window
      yloc := (yloc + hloc/2 - progh/2) ;Calculate y coordinate of Progress window
    }
    Else
    {
      progw := 200
      progh := 100
      xloc := A_ScreenWidth/2 - progw/2     ;Calculate x coordinate of Progress window
      yloc := A_ScreenHeight/2  - progh/2   ;Calculate y coordinate of Progress window

    }
    Progress, B2 x%xloc% Y%yloc% M zh0 w%progw% h%progh%, , %Msg%
    Return
}
;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;
Sort()
{
  Global HowMany
  ; Get id of top-most dialog-type window
  WinGet, Item, list,,, Program Manager
  index := ""                        ; counts number of windows in selection
  Loop, %Item%                       ; loop thro' all current windows, top down.
  {
      this_Item := Item%A_Index%  ; Item1 contains id of first window, etc
      WinGetTitle , Title , ahk_id %this_item%
      WinGetClass, f_class, ahk_id %this_item%

      If Not IsOpenSave(this_Item)
      {
          Item%A_Index% := ""
          continue                ; since not a suitable window
      }
      index++                     ; increment pointer
      Item%index% = %this_Item%
  }
  HowMany:= index    ; number of dialog-type windows collected

  return , Item1
}
;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;
; Enter path of selected folder into dialog window
;
; Based on ChrisM's f_Open_Target ("Easy Access to Favorite Shortcuts" at
; http://www.autohotkey.com/forum/topic5414.html). Modified by DAT to work
; with Directory Opus, 'Move To' and 'Copy To', and 'Export Registry File'
; in Vista and XP.

f_Open_Target( target )
  {
    global f_class, f_Edit1Pos, f_Edit2Pos, f_window_id
    WinGetTitle, Title , ahk_id %f_window_id%
    ; It's a dialog
    If (f_class = "#32770")
      {
        If (f_Edit1Pos <> "" And f_Edit2Pos <> "" And Title <> "Export Registry File")
        ;  Has Edit1 and Edit2 so put folder into Edit2, except if title is 'Export Registry File'
        ;  eg could be 'Save As' in Vista or Browse in DOpus.
          {
;;;;;;;;
; A puzzle for anyone who understands these things:
; There's something funny about the next four lines. The third line works on its own
; for most windows in XP and some in Vista. But to be reliable it needs all four. The
; Save As window in SCite seems especially fastidious.
            ControlGet , temp , Hwnd ,, Edit2, ahk_id %f_window_id%
            ControlClick ,, ahk_id %temp%
            ControlClick ,ToolbarWindow324, ahk_id %f_window_id%
            sleep , 200  ; especially needed for 'Save As' with Scite4AutoHotkey in Vista
;;;;;;;;;;;;;;;;
            ControlSetText, Edit2, %target%, ahk_id %f_window_id%
            ControlSend, Edit2, {Enter}, ahk_id %f_window_id%
            Return
          }
        Else If (f_Edit1Pos <> "" And f_Edit2Pos <> "" And Title = "Export Registry File")
          ; like Reg Export in XP and Vista
          {
            ControlGetText, text, Edit1, ahk_id %f_window_id% ; store filename
            ControlSetText, Edit1, %target%, ahk_id %f_window_id%
            ControlSend, Edit1, {Enter}, ahk_id %f_window_id%
            Sleep, 100  ; needs extra time on some dialogs or in some cases.
            ControlSetText, Edit1, %text%, ahk_id %f_window_id%   ; reinstate stored filename
            Return
          }
        Else If (f_Edit1Pos <> "" And f_Edit2Pos = "")  ; has Edit1 but not Edit2
          {
            ControlGetText, text, Edit1, ahk_id %f_window_id% ; store filename
            ControlSetText, Edit1, %target%, ahk_id %f_window_id% ; target folder into File Name
            If (A_OSVersion = "WIN_VISTA")
              Return

            Else        ; special treatment for XP
            ; Unlike 'SaveAs', Copy Items', 'Move Items', and 'Browse' windows contain SysTreeView321
              {
                winget , ctrls , ControlList , ahk_id %f_window_id%
                Loop, Parse, ctrls, `n
                  IfEqual , A_LoopField , SysTreeView321
                    {
                      WinGetText, FName, ahk_id %f_window_id%   ; Name of file to be moved or copied
                      StringSplit, FName, FName, '              ; is between single quotes
                      WinGetTitle, Title , ahk_id %f_window_id%
                      StringSplit , Title , Title , %A_Space%
                      Message=You selected %Target%
                      IfEqual , Title2 , Items
                        Message=Will %Title1% '%FName2%' to %Target%
                      MsgBox, 1, , %Message%
                      IfMsgBox Cancel
                        return
                    }
                ControlSend, Edit1, {Enter}, ahk_id %f_window_id% ; implement change of target folder
                Sleep, 100  ; It needs extra time on some dialogs or in some cases.
                ControlSetText, Edit1, %text%, ahk_id %f_window_id%   ; reinstate stored filename
                Return
              }
          }
      }
      ; Microsoft Office application
        Else IfInString, f_class, bosa_sdm_
      {
        ; Retrieve any file name that might already be in the File name
        ; control, so that it can be restored after the switch to the new
        ; folder.
        ControlGetText, text, RichEdit20W2, ahk_id %f_window_id%
        ControlClick, RichEdit20W2, ahk_id %f_window_id%
        ControlSetText, RichEdit20W2, %target%, ahk_id %f_window_id%
        ControlSend, RichEdit20W2, {Enter}, ahk_id %f_window_id%
        Sleep, 100  ; It needs extra time on some dialogs or in some case
        ControlSetText, RichEdit20W2, %text%, ahk_id %f_window_id%
        Return
      }
  }
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;
; Makes list of the destination folder paths displayed in Explorer and DOpus.
; Puts them into into 'PathList' with '|' as separator. (This is the default
; separator expected by ListBox in the GUI command).

GetPathList(ClassNames,PathBox)
{
  WinGet, id, list
  PathList :=      ; Pipe delimited list of paths in file browsers
  ;Number :=        ; The number of paths found
  Length :=      ; The number of characters in the longest path
  Loop, %id%
  {
      this_id := id%A_Index%
      WinGetClass, this_class, ahk_id %this_id%
      If this_class contains %ClassNames%
      {
          ;number ++   ; increment
          ControlGet , this_path , Line, 1 , %Pathbox%, ahk_id %this_id%
          this_path = %this_path%         ; Strip any peripheral spaces

          ; Bodge for XP. Copying 'My Documents' from the title bar or from Edit1 of Explorer,
          ; in XP gives just that, not a path, so the next two lines convert it.

          IfEqual , this_path, My Documents
            this_path :=  A_MyDocuments
          PathList = %PathList%0000>%this_path%|   ; Adds 4-digit weight plus | as line separator
      }
  }
Return , PathList
}
;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;
;  Take each new path in turn, then search for same path in History.
;  If found, update the stored weight value. If not found, add new
;  path to the history. Outputs PruneFlag.

DoHistory(pathlist, IniFile)
{
  ;FileRead , History , %DataFileName% ; get stored list
  IniRead , History , %IniFile% , Favourites, History

  OverRun =       ; If a weight exceeds an upper limit, this flag will be set.
  Loop , Parse , pathlist ,`|     ; Take each new path in turn, then search for similar in History
  {
    IfEqual , A_LoopField     ; Must have reached end of pathlist
      Break
    StringSplit ,  Section , A_LoopField , >  ; Section1=weight, Section2=path

    ; Now check for same path in contents of History. Compare the new path plus separator with
    ; each entry in history.
    Section2 = %Section2%|
    Posn := InStr(History , Section2)    ; gets position of first occurrence in History
    IfNotEqual , Posn , 0     ; If search for Path was successful
    {
      Posn -= 5               ; Point to first digit of its weight number
      OldWeight := SubStr(History , Posn, 4)  ; get the weight digits
      IfGreater , OldWeight , 999 ;99  ; Parameter must be =< 9998 to avoid overflow.
        OverRun = 1   ; Triggers a rescaling procedure if limit was exceeded.

      ; Replace existing weight and path in History with an updated version
      SearchText = %OldWeight%>%Section2%   ;  This is the old entry if it exists
      NewWeight = %OldWeight%
      NewWeight +=1
      NewWeight := SubStr("0000" . NewWeight, -3) ; Format as 4-digits with leading zeros (see Help for SetFormat).
      NewValue = %NewWeight%>%Section2%
      StringReplace , History , History , %SearchText% , %NewValue%
    }
    Else      ; New weight and path not in History, so append it
      History = %History%%A_LoopField%`|
  }
  If OverRun
  {
    Prune(IniFile,3)    ; Divides all weights in the history by the parameter
    Return , OverRun
  }

  IniWrite, %History% , %IniFile% , Favourites, History
  Return , OverRun
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
; Removes paths and leaves just folder names.
RemovePath(DisplayList)
{
  NewDisplayList = %DisplayList%
  Loop, Parse , DisplayList , `|
  {
    SplitPath , A_LoopField , name , dir
    StringReplace , NewDisplayList, NewDisplayList, %dir%
   ; msgbox , A_LoopField=%A_LoopField%`ndir=%dir%`nname=%name%`nNewDisplayList=%NewDisplayList%
  }
  Return , NewDisplayList
}
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;
;  Adds full path back again after RemovePath() has removed them.
MakeIntoFullPath(Path,DisplayList)
{
  Loop, Parse , DisplayList , `|
  {
    StringGetPos , Posn , A_LoopField , %Path% , R
    If !ErrorLevel
    {
      temp = %A_LoopField%
      StringReplace , temp , temp , %Path% , ``
      StringSplit , item , temp , ``
      If !Item2
        Return , A_LoopField
    }
  }
}
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
; Get number of characters in longest path
GetMaxLength(DisplayList)
{
  Lngth =
  Loop, Parse , DisplayList , `|
  {
    If StrLen(A_LoopField)>Lngth
      Lngth := StrLen(A_LoopField)
  }
Return , Lngth
}
;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;
; Divides all stored weights by a factor and drops those that become zero
Prune(IniFile,PruneFactor)
{
  IniRead , History , %IniFile% , Favourites, History   ; get stored list

  ;FileRead , History , %DataFileName% ; get stored list

  NewHistory =
  Loop , Parse , History ,`|
  {
    Item= %A_LoopField%  ; contains weight and path
    StringSplit , Section , Item , >  ; Section1=weight, Section2=path
    IfEqual , Item     ; Must have reached end of History
      Break
    Section1 /=%PruneFactor%
    IfNotEqual , Section1 , 0 ; If weight has not dropped to zero
    {
      Section1 := SubStr("0000" . Section1, -3) ; Show as a 4-digit number with leading zeros - see Help for SetFormat).
      NewHistory = %NewHistory%%Section1%>%Section2%|
    }
  }
  IniDelete, %IniFile% , Favourites, History
  IniWrite, %NewHistory% , %IniFile% , Favourites, History

  ;FileDelete , %DataFileName%   ; Delete old history
  ;FileAppend  , %NewHistory% , %DataFileName% ; Store new history
  Return
}
;;;;;;;;

;;;;;;;;;;;
; Function by Andreone at http://www.autohotkey.com/forum/topic22178.html
; 31-12-2008
;
IsOverTitleBar(x, y, hWnd)
{
   SendMessage, 0x84,, (x & 0xFFFF) | (y & 0xFFFF) << 16,, ahk_id %hWnd%
   if ErrorLevel in 2,3,8,9,20,21
      return true
   else
      return false
}
;;;;;;;;;;;;;;;;;;;

;------------------------------------------------------------------------------------------------
; The following functions are by Majkinetor with hacks by DAT for
; 'Move Items' and 'Copy Items', MS Publisher2000, and to give some
; functionality for Vista.

; To include windows 7, a good place to start might be the post by rs dated 06-01-2010 at
; http://www.autohotkey.com/forum/topic12412-105.html

IsOpenSave(dlg)
{
    global FavMenu_dlgInput, FavMenu_dlgType

    FavMenu_dlgType =
    toolbar := FavMenu_FindWindowExID(dlg, "ToolbarWindow32", 0x440)   ;windows XP
    if (toolbar = "0")
     toolbar := FavMenu_FindWindowExID(dlg, "ToolbarWindow32", 0x001)  ;windows 2k

    combo  := FavMenu_FindWindowExID(dlg, "ComboBoxEx32", 0x47C) ; comboboxex field
    button := FavMenu_FindWindowExID(dlg, "Button", 0x001)      ; second button

    edit := FavMenu_FindWindowExID(dlg, "Edit", 0x480)          ; edit field

    if (toolbar && (combo || edit) && button)
    {
        FavMenu_dlgInput    := combo + edit
        FavMenu_dlgType     := "OpenSave"
        return 1
    }
    return FavMenu_IsOffice03(dlg)
}

;------------------------------------------------------------------------------------------------

FavMenu_IsOffice03(dlg)
{
    global FavMenu_dlgInput, FavMenu_dlgType

    WinGetClass cls, ahk_id %dlg%
    if cls contains bosa_sdm_
    {
        snake := FavMenu_FindWindowExID(dlg, "Snake List", 0)
        FavMenu_dlgInput := FavMenu_FindWindowExID(dlg, "RichEdit20W", 54)
        if ! (snake && FavMenu_dlgInput)
            return, Misc_Others(dlg)
        FavMenu_dlgType := "Office03"
        return 1
    }
    return , Misc_Others(dlg)
}

;-------------------------------------------------------------------------------

Misc_Others(dlg)  ; Hacked in by DAT 28-03-2010
{
    global FavMenu_dlgInput, FavMenu_dlgType

    WinGetClass cls, ahk_id %dlg%
     If (cls <> "#32770") And (cls <> "bosa_sdm_Mso96")
        Return 0


    ;  check for 'Move Items' and 'Copy Items'
    WinGetTitle , Title , ahk_id %dlg%

    If Title In Save,Save File,Save As,Move Items,Copy Items,Browse For Folder,Browse  ; Add extras here, with one comma and no spaces between each.
        return 1

    ;  check for Office2000 [Tested only for Publisher 2000]
    If (cls = "bosa_sdm_Mso96")
          return 1

  Return, 0
}
;------------------------------------------------------------------------------------------------
; Iterate through controls with the same class, find the one with ctrlID and return its handle
; Used for finding a specific control on a dialog

FavMenu_FindWindowExID(dlg, className, ctrlId)
{
    local ctrl, id

    ctrl = 0
    Loop
    {
        ctrl := DllCall("FindWindowEx", "uint", dlg, "uint", ctrl, "str", className, "uint", 0 )
        if (ctrlId = "0")
            return ctrl

        if (ctrl != "0")
        {
            id := DllCall( "GetDlgCtrlID", "uint", ctrl )
            if (id = ctrlId)
                return ctrl
        }
        else
            return 0
    }
}
;----------------------------------------------------------