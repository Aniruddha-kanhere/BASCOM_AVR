$regfile "m128def.dat"
$crystal = 16000000
$baud = 19200
$swstack = 10
$hwstack = 32
$framesize = 40

Config Porta = Output
Config Portc = Input

Dim A As Byte

For A = 0 To 3
If Pinc.4 = 1