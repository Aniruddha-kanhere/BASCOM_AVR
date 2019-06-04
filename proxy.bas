$regfile "m8def.dat"
$crystal = 16000000
$baud = 19200
$framesize = 40
$sim


Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2
Dim A As Bit
Dim B As Bit

A = 0
B = Not A
Config Pind.6 = Input

Proxy1 Alias Pind.6
Do
If Proxy1 = A Then
Cls
Lcd "proxy is On"
Elseif Proxy1 = B Then
Cls
Lcd "proxy is off"
 End If

Loop