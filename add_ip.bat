REM ADD Multiple IPs to Windows 2008 Windows 2008 R2 Windows 2012 


REM-----Definitions-----
REM 227 -> First IP of the range
REM REM 1 -> 1 Step.
REM REM 254 -> Final IP of range.
REM
REM REM Local Area Connection -> Connection Name
REM
REM REM 255.255.255.0 -> Netmask 
REM
REM REM------Definitions------- 
REM
REM
REM REM FOR /L %I IN (227,1,254) DO netsh interface ip add address "Wireless Network Connection" 173.243.121.%I 255.255.255.224
REM
REM
