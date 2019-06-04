$regfile "m8def.dat"
$crystal = 16000000
$baud = 19200
$framesize = 40
$sim


Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2

Config Timer1 = Timer , Prescale = 1024
Config Com1 = Dummy , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0

Declare Sub Sent()
Dim A As Double
Dim B As Byte
A = 0
B = 0

On Ovf1 Maggi
'On Utxc Maggi
Enable Timer1
'Enable Utxc
Enable Interrupts

'Start Timer1

Tcnt1 = 34254

Do
Incr A
Cls
Lcd A
Waitms 500

Loop


Maggi:
Incr B
Tcnt1 = 40000
'Incr A
Cls
Lcd "maggi"
Lowerline
Lcd B
Print B
Waitms 200
Return

'Sub Sent()
'Incr B
'Print B
'End Sub Sent()

End