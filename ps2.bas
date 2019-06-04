$regfile "m8def.dat"
$crystal = 16000000
''$baud = 19200
$framesize = 40
$hwstack = 32
$swstack = 10

Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2

Config Pinb.1 = Input
Config Portb.0 = Output
Config Portd.6 = Output
Config Portd.5 = Output
Config Portd.7 = Output
'config Portd.1 = Output

Dim K As Byte
Dim I As Byte
Dim B As Byte
Dim A As Byte
Dim L As Byte
Dim H As Byte
Dim T As Bit
Dim T1 As Bit
T = 1
T1 = Not T
K = 0

'Led Alias Portd.1
Ps2_data Alias Pinb.1
Ps2_command Alias Portd.7
Ps2_clock Alias Portb.0
Ps2_att Alias Portd.6
Ps2_ack Alias Portd.5

Declare Sub Initialise()
Declare Sub Enter_config()
Declare Sub Set_mode()
Declare Sub Poling()
Declare Sub Exit_config()
Declare Sub Read_write(byval L As Byte , Byval H As Byte)
Declare Sub Shortpol()





'/////////////////////main//////////////////////////////////////////////////////////////
Set Ps2_ack

For I = 1 To 3
Set Ps2_att
Reset Ps2_att
Call Shortpol()
Next


Set Ps2_att
Reset Ps2_att
Call Initialise()
Set Ps2_att
Reset Ps2_att
Call Enter_config()
Set Ps2_att
Reset Ps2_att
Call Set_mode()
Set Ps2_att
Reset Ps2_att
Call Exit_config()
Set Ps2_att





Cls
Lcd "wait for polling"
Wait 2

Sub Poling()
Cls
Lcd "polling starts"
''Wait 2


Do

Reset Ps2_att
'Call Exit_config()
A = &H01
Call Read_write(a , B)
Waitus 2


A = &H42
Call Read_write(a , B)
Waitus 2

A = &H00
Call Read_write(a , B)
Waitus 2

A = &H00
Call Read_write(a , B)
Waitus 2


A = &H00
Call Read_write(a , B)
Waitus 2


A = &H00
Call Read_write(a , B)

'(If B = &H7F Then"
Cls
Lcd "med" ; B
Elseif B >= &H00 And B < &H7F Then
Cls
Lcd "right" ; B
Elseif B <= &HFF And B > &H7F Then
Cls
Lcd "left" ; B
End If
Waitus 16
 )')
A = &H00
Call Read_write(a , B)

If B < &H7F And B >= &H00 Then
Cls
Lcd "up" ; B
Elseif B = &H7F Then
Cls
Lcd "middle" ; B
Elseif B <= &HFF And B > &H7F Then
Cls
Lcd "down" ; B
End If
Waitus 16


A = &H00
Call Read_write(a , B)

If B < &H7F And B >= &H00 Then
Cls
Lowerline
Lcd "up" ; B
Elseif B = &H7F Then
Cls
Lowerline
Lcd "middle" ; B
Elseif B <= &HFF And B > &H7F Then
Cls
Lowerline
Lcd "left" ; B
End If
Waitus 16

A = &H00
Call Read_write(a , B)

If B < &H7F And B >= &H00 Then
Cls
Lowerline
Lcd "up" ; B
Elseif B = &H7F Then
Cls
Lowerline
Lcd "middle" ; B
Elseif B <= &HFF And B > &H7F Then
Cls
Lowerline
Lcd "down" ; B
End If
Waitus 16

Set Ps2_att

Loop
End Sub




'+++++++++++++++++++++++++++++++++++++++++++++++++end______________________________________________________________
'////////////////rerad_write///////////////////////////////////////////////////////
Sub Read_write(byval L As Byte , Byval H As Byte)



For I = 0 To 7
Reset Ps2_clock
If L.i = T Then
Set Ps2_command
Else
Reset Ps2_command
End If
Set Ps2_clock
Waitus 2
If Ps2_data = T Then
H.i = T
Else
H.i = T1
End If
Waitus 2
 Next





'(For I = 0 To 7
Reset Ps2_clock
Set Ps2_clock
Ps2_command = L.i
Waitus 2
Reset Ps2_clock
Ps2_data = H.i
If H.i = 1 Then
H.1 = 0
Elseif H.i = 0 Then
H.i = 1
End If
Next
')                                                       ')                                                       ')
'(
Ps2_command = L.0
Waitus 2
Ps2_data = H.0
Waitus 2
Ps2_command = L.1
Waitus 2
Ps2_data = H.1
Waitus 2
Ps2_command = L.2
Waitus 2
Ps2_data = H.2
Waitus 2
Ps2_command = L.3
Waitus 2
Ps2_data = H.3
Waitus 2
Ps2_command = L.4
Waitus 2
Ps2_data = H.4
Waitus 2
Ps2_command = L.5
Waitus 2
Ps2_data = H.5
Waitus 2
Ps2_command = L.6
Waitus 2
Ps2_data = H.6
Waitus 2
Ps2_command = L.7
Waitus 2
Ps2_data = L.7
Waitus 2
')
End Sub
'**************initialise************************
Sub Initialise()
Cls
Lcd "initialise"
''Wait 1
A = &H01
Call Read_write(a , B)

Waitus 16


A = &H42
Call Read_write(a , B)

Waitus 16


A = &H00
Call Read_write(a , B)

Waitus 16


A = &HFF
Call Read_write(a , B)

Waitus 16

A = &HFF
Call Read_write(a , B)

Waitus 16

End Sub
'---------------------------------------enter config -------------------------------------------------------


Sub Enter_config()
Cls
Lcd "enterconfig"
''Wait 1

A = &H01
Call Read_write(a , B)

Waitus 16


A = &H43
Call Read_write(a , B)

Waitus 16

A = &H00
Call Read_write(a , B)

Waitus 16


A = &H01
Call Read_write(a , B)

Waitus 16


A = &H03
Call Read_write(a , B)

Waitus 16


End Sub

'__________________________set mode_____________________________________________________________


Sub Set_mode()
  Cls
Lcd "setmode"
''Wait 1

A = &H01
Call Read_write(a , B)

Waitus 16

A = &H44
Call Read_write(a , B)

Waitus 16


A = &H00
Call Read_write(a , B)

Waitus 16

A = &H01
Call Read_write(a , B)

Waitus 16


A = &H03
Call Read_write(a , B)

Waitus 16



End Sub
'++++++++++++++++++++++++++exit config++++++++++++++++++++++++++++++++++++++++++++++++++0

Sub Exit_config()
  Cls
Lcd "exitconfig"
''Wait 1

A = &H01
Call Read_write(a , B)

Waitus 16

A = &H43
Call Read_write(a , B)

Waitus 16


A = &H00
Call Read_write(a , B)

Waitus 16

A = &H00
Call Read_write(a , B)

Waitus 16


A = &H5A
Call Read_write(a , B)

Waitus 16

A = &H5A
Call Read_write(a , B)

Waitus 16


A = &H5A
Call Read_write(a , B)

Waitus 16

A = &H5A
Call Read_write(a , B)

Waitus 16


A = &H5A
Call Read_write(a , B)

Waitus 16

End Sub




'////////////////////////////////////////////////////////////////////////////////////////////////
Sub Shortpol()
 Cls
Lcd "shortpoll"
''Wait 1

A = &H01
Call Read_write(a , B)

Waitus 16

A = &H42
Call Read_write(a , B)

Waitus 16


A = &H00
Call Read_write(a , B)

Waitus 16

A = &HFF
Call Read_write(a , B)

Waitus 16


A = &HFF
Call Read_write(a , B)

Waitus 16



End Sub

'______________________________________+++++++++++++++++++++++++++++______________________________________________