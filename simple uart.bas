$regfile "m128def.dat"
$crystal = 16000000
$baud = 57600

Config Lcdpin = Pin , Rs = Porta.3 , E = Porta.4 , Db4 = Porta.5 , Db5 = Porta.6 , Db6 = Porta.7 , Db7 = Portg.2
Config Lcd = 16 * 2
Config Com1 = 57600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0


Config Portg.0 = Output
Config Portg.1 = Output

Dim T As Integer
Dim K As Byte
Dim L As Byte
Dim M As Integer
Dim S As Integer
Dim J As Integer

Do



T = Waitkey()

'(
If T < 254 Then
Cls
Lcd T
'Waitms 200


Elseif T = 255 Then


K = Waitkey()
Cls
Lcd K
Waitms 100

L = Waitkey()
Cls
Lcd L
Waitms 100

M = Waitkey()
Cls
Lcd M
Waitms 100
')

'(
If M = 255 Then
S = K * 255
J = S + L

Cls
Lcd J
Waitms 100

End If

')

If T = &HBC Then
Cls
Lcd T
Reset Portg.0
Set Portg.1

Elseif T = &H7C Then
reset Portg.0
Reset Portg.1

End If
T = 0
Loop

End                                                         'end program