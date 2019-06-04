$regfile "m8def.dat"
$crystal = 16000000
$baud = 19200
$framesize = 40



Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2
Config Com1 = Dummy , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0

Config Pind.2 = Input
Config Pind.3 = Input

Ch1 Alias Pind.2
Ch2 Alias Pind.3

'Declare Sub Encoderupdate()


'Config Timer1 = Timer , Prescale = 1024

Dim A As Bit
Dim B As Bit
Dim C As Byte
Dim D As Byte
Dim E As Integer
A = 0
B = Not A
E = 0

On Int0 Ch2check Nosave
Config Int0 = Rising
Enable Int0
Enable Interrupts



Portd = &B0011





  Do

  Cls
'Lowerline

Lcd E

Loop



 Ch2check:
If Ch2 = B Then
Incr E
'Cls
'Lowerline
'Lcd E

Elseif Ch2 = A Then

Decr E

End If
Return

  End                                                       'end program