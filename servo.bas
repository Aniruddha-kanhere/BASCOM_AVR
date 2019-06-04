$regfile "m32def.dat"
$crystal = 12000000
$baud = 19200
$framesize = 40
$sim


'Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
'Config Lcd = 16 * 2
Config Servos = 1 , Servo1 = Porta.3 , Reload = 10

Config Porta.3 = Output

Dim A As Integer
Dim B As Integer

Enable Interrupts

Servo(1) = 10

Do

Loop

Do
For A = 0 To 100
Servo(1) = A
Wait 1

Next

For A = 100 To 0
Servo(1) = A
Wait 1
Next
Loop
End                                                         'end program
