; Emacs like
<^b::Send, {Left}
<^f::Send, {Right}
<^p::Send, {Up}
<^n::Send, {Down}
<^a::Send, {Home}
<^e::Send, {End}
<^h::Send, {Backspace}

#IfWinNotActive ahk_exe WindowsTerminal.exe
  <^k::Send, +{End}{Del}
  $!v::Send, ^v
  $!c::Send, ^c
#IfWinNotActive

#IfWinNotActive ahk_exe Code.exe
  $<!n::Send, ^n
  $<!f::Send, ^f
  $<!l::Send, ^l

  <![::Send, !{Left}
  <!]::Send, !{Right}
#IfWinNotActive

is_windows_terminal() {
  If WinActive("ahk_exe WindowsTerminal.exe")
    Return 1

  Return 0
}

is_vscode() {
  If WinActive("ahk_exe Code.exe")
    Return 1

  Return 0
}

$!w::
  If is_windows_terminal() or is_vscode()
    Send, !w
  Else
    Send, ^w
  Return