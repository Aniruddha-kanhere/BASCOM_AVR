$regfile "m8def.dat"
$crystal = 16000000


Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2

Config Pinb.0 = Input
 Config Portd.7 = Output

Dim Capture As Integer
Dim Time1 As Integer
Dim Range As Integer


Config Timer1 = Timer , Prescale = 1

'Config Timer1 = Counter , Edge = Falling , Capture Edge = Rising , Noise Cancel = 1


Enable Int0
Config Int0 = Falling

On Int0 Maggi Nosave
On Ovf1 Maggi2
Enable Interrupts

Do


Tcnt1 = 65375
Enable Timer1
 Set Portd.7

Time1 = Capture / 65535
Range =(time1 *(340)) / 2

Cls
Lcd Range

Loop

'/////////////////////maggi2////////////////////////
Maggi2:
Reset Portd.7
Tcnt1 = 0
Return


'//////////////////maggi/////////////////////////
Maggi:

Capture = Tcnt1
'Tcnt1 = 65375

Return


