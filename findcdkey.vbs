'---**********************************************************************---'
'Script designed to find cd key on windows operating systems'
'scripted by Jerry Reid'
'10/20/2010'
'---**********************************************************************---'

Set WshShell = WScript.CreateObject("WScript.Shell")
HexBuf = WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DigitalProductId")
For l = lBound(HexBuf) to uBound(HexBuf)
tmp=tmp & " "& Hex (HexBuf(l))
next
StartOffset = 52
EndOffset =67
Dim Digits (24)

'conversion from digits to letter; taken from msdn library'
Digits (0) = "B" : Digits (1) = "C": Digits (2) = "D": Digits (3) = "F":
Digits (4) = "G": Digits (5) = "H": Digits (6) = "J": Digits (7) = "K":
Digits (8) = "M": Digits (9) = "P": Digits (10) = "Q": Digits (11) = "R":
Digits (12) = "T": Digits (13) = "V": Digits (14) = "W": Digits (15) = "X":
Digits (16) = "Y": Digits (17) = "2": Digits (18) = "3": Digits (19) = "4":
Digits (20) = "6" : Digits (21) = "7" : Digits (22) = "8": Digits (23) = "9"
'conversion from digits to letter; taken from msdn library'

dLen = 29
sLen = 15
Dim HexDigitalPID (15)
Dim Des (30)
For i = StartOffset to EndOffset
HexDigitalPID (i-StartOffset) = HexBuf(i)
tmp2=tmp2 & " "& Hex (HexDigitalPID(i-StartOffset))
next
KEYSTRING =""
for i=dLen-1 to 0 step -1
if ((i + 1) mod 6) = 0 then
Des (i) = "-"
KEYSTRING =KEYSTRING & "-"
else
HN = 0
     For N = (sLen -1) to 0 step -1
       Value = ( (HN *2^8 ) Or HexDigitalPID (N))
        HexDigitalPID (N) = Value \ 24
        HN    = (Value mod 24)

     next

Des(i) = Digits(HN)
KEYSTRING =KEYSTRING & Digits(HN)
end if
next
KEYSTRING2 = StrReverse (KEYSTRING)
WScript.Echo "Your CD-Key is: " & KEYSTRING2
