$regfile = "M88DEF.DAT"
$crystal = 12000000

Config Portd = Output

Do
Reset Portd.5
Set Portd.6

Wait 1

Set Portd.5
Reset Portd.6

Wait 1
Loop
