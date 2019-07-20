$regfile "m32def.dat"
$crystal = 16000000
'$baud = 57600
$hwstack = 32                                               ' Hardware Stack 32
$swstack = 10                                               ' Software Stack 10
$framesize = 40                                             ' Frame space 40

Config Lcdpin = Pin , Db4 = Portd.2 , Db5 = Portd.3 , Db6 = Portd.4 , Db7 = Portd.5 , E = Portd.1 , Rs = Portd.0
Config Lcd = 16 * 2

Cls
Lcd "test"

'###########################################      CONFIG PART + DECLARATION      ##############################################################
'Config Com1 = 57600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
'Open "com1:" For Binary As #1

'  TQFP Package
Config Porta.3 = Input                                      'ack Portb.6 = Output                                     ATN
Set Porta.3
Config Porta.1 = Output                                     'attn Portd.5 = Output                                     'CLK
Config Porta.0 = Output                                     'cmd Portd.6 = Output                                     'CMD
Config Porta.2 = Output                                     'clk Portb.6 = Input                                      'DAT
Config Portd.6 = Input


'(  dip Package
Config Portd.5 = Input                                      'ack Portb.6 = Output                                     ATN
Config Portd.6 = Output                                     'attn Portd.5 = Output                                     'CLK
Config Portd.7 = Output                                     'cmd Portd.6 = Output                                     'CMD
Config Portb.0 = Input                                      'clk Portb.6 = Input                                      'DAT
Config Portb.4 = Output                                     'data Portb.2 = Input                                      'ACK
Config Portb.5 = Output                                     'Portb.2 = Input                                      'ACK
')

Dim D0 As Byte , D1 As Byte , D2 As Byte , D3 As Byte , D4 As Byte , D5 As Byte , D6 As Byte , D7 As Byte , D8 As Byte , D9 As Byte , D10 As Byte , D11 As Byte , D12 As Byte , D13 As Byte , D14 As Byte , D15 As Byte , D16 As Byte , D17 As Byte , D18 As Byte , D19 As Byte , D20 As Byte
Dim C0 As Byte , C1 As Byte , C2 As Byte , C3 As Byte , C4 As Byte , C5 As Byte , C6 As Byte , C7 As Byte , C8 As Byte , C9 As Byte , C10 As Byte , C11 As Byte , C12 As Byte , C13 As Byte , C14 As Byte , C15 As Byte , C16 As Byte , C17 As Byte , C18 As Byte , C19 As Byte , C20 As Byte
Dim Binaryv(8) As Byte , Flag As Byte , Adcval As Single , Datamain As Byte , Count As Integer

Declare Sub Ps2(datum As Byte , Byval Command As Byte )

'###############################################        VALUE ASSIGNMENT          ############################################
Datamain = 0
Count = 0

'(
Dat Alias Pinb.2
Clk Alias Portb.1                                           'Portd.6                                           ''
Cmd Alias Portb.0                                           'Portd.5                                           'same as dat but input
Atnt Alias Portd.7                                          'Portb.6
Ackn Alias Pind.6
')

'                 DIP Package

Dat Alias Pina.3
Clk Alias Porta.1                                           'Portd.6                                           ''
Cmd Alias Porta.2                                           'Portd.5                                           'same as dat but input
Atnt Alias Porta.0                                          'Portb.6
Ackn Alias Pind.5

'(
'new PS2 ATmega88 pin config @12Mhz 57600 baud
Config Portb.0 = Input
Config Portb.1 = Input
Config Portd.5 = Output
Config Portd.6 = Output
Config Portd.7 = Output

Set Portb.0

Atnt Alias Portd.5
Clk Alias Portd.7
Cmd Alias Portd.6
Dat Alias Pinb.0

Config Portc.2 = Output
')

'(Do
Set Portc.2
Waitms 100
Reset Portc.2
Waitms 100

Printbin #1 , 26
Loop

')

Set Clk
Set Atnt

Binaryv(1) = 1
Binaryv(2) = 2
Binaryv(3) = 4
Binaryv(4) = 8
Binaryv(5) = 16
Binaryv(6) = 32
Binaryv(7) = 64
Binaryv(8) = 128

Cls
Lcd "test"
Wait 1
'-----------------------------------------short poll - to refresh and initiate ----------------------------------------
'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
'(
Dim I As Integer
I = 0
For I = 0 To 3
Call Ps2(d1 , &H01)
Call Ps2(d1 , &H42)
Call Ps2(d1 , &H00)
Call Ps2(d1 , &HFF)
Call Ps2(d1 , &HFF)

Next
')

'-------------------------------------------------------------------------------------------------------------------------
'--------------------------------=====================CONFIG THE PS2==================------------------------------------
'------------------------------=====================go into CONFIG mode==================------------------------------------

'Cls
'Lcd "in 1:"

Dim Ani As Integer
Ani = 0

Do
D3 = D4 = 0
D1 = D2 = 0
D5 = D6 = 0
Reset Atnt
Waitus 10
Call Ps2(d1 , &H01)
Call Ps2(d2 , &H43)

'If D2 = &H73 Then
 'Goto 1
'Else                                                        'if D2 = &H41 Then
 Exit Do
'End If

Set Atnt
Waitms 10

Loop

Call Ps2(d3 , &H00)
Call Ps2(d4 , &H01)
Call Ps2(d5 , &H00)

Set Atnt
Waitms 100

'----------------------------===============SET CONTROLLER FOR ANALOGUE MODE================------------------------

'Cls
'Lcd "in analogue"

Do

Reset Atnt
Waitus 10
D3 = D4 = 0
D1 = D2 = 0
D5 = D6 = 0
D7 = D8 = 0
D9 = 0

Call Ps2(d1 , &H01)
Call Ps2(d2 , &H44)
Call Ps2(d3 , &H00)
Call Ps2(d4 , &H01)
Call Ps2(d5 , &H03)
Call Ps2(d6 , &H00)
Call Ps2(d7 , &H00)
Call Ps2(d8 , &H00)
Call Ps2(d9 , &H00)

If D2 = &HF3 Then                                           '''''''''''''''''''''''''''''''''''''''''''''''''''
 Exit Do
End If

Set Atnt
Waitus 10

If Ani = 50 Then
 Exit Do
End If

Incr Ani

Loop

Set Atnt
'--------------------------------==================EXIT THE CONFIG MODE=====================----------------------------------

'Cls
'Lcd "exit"
Ani = 0

Do
D3 = D4 = 0
D1 = D2 = 0
D5 = D6 = 0
D7 = D8 = 0
Datamain = 0

Waitus 10
Reset Atnt

Call Ps2(d1 , &H01)
Call Ps2(datamain , &H43)
Call Ps2(d2 , &H00)

Call Ps2(d3 , &H00)
Call Ps2(d4 , &H5A)
Call Ps2(d5 , &H5A)
Call Ps2(d6 , &H5A)
Call Ps2(d7 , &H5A)
Call Ps2(d8 , &H5A)

If Datamain = &H73 Then
 'Set Atnt
 'Exit Do
End If
Set Atnt

Waitus 20
If Ani = 50 Then
   Exit Do
End If
Incr Ani


Loop


Call Ps2(d3 , &H00)
Call Ps2(d4 , &H5A)
Call Ps2(d5 , &H5A)
Call Ps2(d6 , &H5A)
Call Ps2(d7 , &H5A)
Call Ps2(d8 , &H5A)
Set Atnt


'---------------------------------------------------POLLING STARTS---------------------------------------------------------
1:
'Cls
'Lcd "polling"
Dim One As Byte , Two As Byte , Three As Byte , Four As Byte , X As Single , Y As Single , Ang As Byte
Dim Temp_ang As Single , Four_old As Byte , Go As Byte , Four_old2 As Byte , Count1 As Integer


Go = 1

Do
2:
Reset Atnt
Waitus 10
D3 = D4 = 0
D1 = D2 = 0
D5 = D6 = 0
D7 = D8 = 0
D9 = D10 = 0

Call Ps2(d1 , &H01)
Call Ps2(d2 , &H42)
Call Ps2(d3 , &H00)
Call Ps2(d4 , &H00)
Call Ps2(d5 , &H00)
Call Ps2(d6 , &H00)                                         'test whether removing d5-d10 matters. because they are redundant
Call Ps2(d7 , &H00)
Call Ps2(d8 , &H00)
Call Ps2(d9 , &H00)
Call Ps2(d10 , &H00)
Set Atnt

Cls
Lcd D4 ; " " ; D5 ; " " ; D6
Lowerline
Lcd D7 ; " " ; D8 ; " " ; D9

X = 128 - D8
Y = 128 - D9

If X < -30 Or X > 30 Then
    Temp_ang = Atn2(x , Y)
Elseif Y < -30 Or Y > 30 Then
    Temp_ang = Atn2(x , Y)
Else
   Temp_ang = 4
End If




If Temp_ang < 0.6981 And Temp_ang > -0.6981 Then            '0.1309
   Ang = 0                                                  '0d
   Four.0 = 1
   Four.1 = 1                                               ''3
   Four.2 = 0
   Four.3 = 0
   Four.4 = 0
   Four.5 = 0
   Four.6 = 0
   Four.7 = 0
Elseif Temp_ang > 0.6981 And Temp_ang < 1.1781 Then
   Ang = 1
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''19
   Four.4 = 1
   Four.5 = 0
   Four.6 = 0
   Four.7 = 0                                               '60d
Elseif Temp_ang > 1.1781 And Temp_ang < 1.4399 Then
   Ang = 2
   Four.0 = 1
   Four.1 = 1                                               ''35
   Four.2 = 0
   Four.3 = 0
   Four.4 = 0
   Four.5 = 1
   Four.6 = 0
   Four.7 = 0                                               '75d
Elseif Temp_ang > 1.4399 And Temp_ang < 1.7017 Then
   Ang = 3
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''51
   Four.4 = 1
   Four.5 = 1
   Four.6 = 0
   Four.7 = 0                                               '90d
Elseif Temp_ang > 1.7017 And Temp_ang < 1.9635 Then
   Ang = 4
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''67
   Four.4 = 0
   Four.5 = 0
   Four.6 = 1
   Four.7 = 0                                               '105d
Elseif Temp_ang > 1.9635 And Temp_ang < 2.4434 Then
   Ang = 5
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''83
   Four.3 = 0
   Four.4 = 1
   Four.5 = 0
   Four.6 = 1
   Four.7 = 0                                               '120d
Elseif Temp_ang > 2.4434 And Temp_ang < 3.5 Then
   Ang = 6
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''93
   Four.4 = 0
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '180
Elseif Temp_ang > -3.5 And Temp_ang < -2.4434 Then
   Ang = 6
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''93
   Four.4 = 0
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '180
Elseif Temp_ang < -0.6981 And Temp_ang > -1.1781 Then
   Ang = 7
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0
   Four.4 = 1                                               ''115
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '-60d

Elseif Temp_ang < -1.1781 And Temp_ang > -1.4399 Then
   Ang = 8
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''131
   Four.4 = 0
   Four.5 = 0
   Four.6 = 0
   Four.7 = 1                                               '-75d
Elseif Temp_ang < -1.4399 And Temp_ang > -1.7017 Then
   Ang = 9
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''147
   Four.3 = 0
   Four.4 = 1
   Four.5 = 0
   Four.6 = 0
   Four.7 = 1                                               '-90d
Elseif Temp_ang < -1.7017 And Temp_ang > -1.9635 Then
   Ang = 10
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''163
   Four.4 = 0
   Four.5 = 1
   Four.6 = 0
   Four.7 = 1                                               '-105d

Elseif Temp_ang < -1.9635 And Temp_ang > -2.4434 Then
   Ang = 11
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''179
   Four.4 = 1
   Four.5 = 1
   Four.6 = 0
   Four.7 = 1                                               '-120d

Else

   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''243
   Four.3 = 0
   Four.4 = 1
   Four.5 = 1
   Four.6 = 1
   Four.7 = 1                                               'stop

End If





'(
If Temp_ang < 0.2618 And Temp_ang > -0.2618 Then            '0.1309
   Ang = 0                                                  '0
   Four.0 = 1
   Four.1 = 1                                               ''3
   Four.2 = 0
   Four.3 = 0
   Four.4 = 0
   Four.5 = 0
   Four.6 = 0
   Four.7 = 0
Elseif Temp_ang > 0.2618 And Temp_ang < 0.7854 Then
   Ang = 1
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''19
   Four.4 = 1
   Four.5 = 0
   Four.6 = 0
   Four.7 = 0                                               '30
Elseif Temp_ang > 0.7854 And Temp_ang < 1.309 Then
   Ang = 2
   Four.0 = 1
   Four.1 = 1                                               ''35
   Four.2 = 0
   Four.3 = 0
   Four.4 = 0
   Four.5 = 1
   Four.6 = 0
   Four.7 = 0                                               '60
Elseif Temp_ang > 1.309 And Temp_ang < 1.8326 Then
   Ang = 3
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''51
   Four.4 = 1
   Four.5 = 1
   Four.6 = 0
   Four.7 = 0                                               '90
Elseif Temp_ang > 1.8326 And Temp_ang < 2.3562 Then
   Ang = 4
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''67
   Four.4 = 0
   Four.5 = 0
   Four.6 = 1
   Four.7 = 0                                               '120
Elseif Temp_ang > 2.3562 And Temp_ang < 2.8798 Then
   Ang = 5
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''83
   Four.3 = 0
   Four.4 = 1
   Four.5 = 0
   Four.6 = 1
   Four.7 = 0                                               '150
Elseif Temp_ang > 2.8798 And Temp_ang < 3.5 Then
   Ang = 6
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''93
   Four.4 = 0
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '180
Elseif Temp_ang > -3.5 And Temp_ang < -2.8798 Then
   Ang = 6
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''93
   Four.4 = 0
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '180
Elseif Temp_ang < -0.2618 And Temp_ang > -0.7854 Then
   Ang = 7
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0
   Four.4 = 1                                               ''115
   Four.5 = 1
   Four.6 = 1
   Four.7 = 0                                               '-30

Elseif Temp_ang < -0.7854 And Temp_ang > -1.309 Then
   Ang = 8
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''131
   Four.4 = 0
   Four.5 = 0
   Four.6 = 0
   Four.7 = 1                                               '-60
Elseif Temp_ang < -1.309 And Temp_ang > -1.8326 Then
   Ang = 9
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''147
   Four.3 = 0
   Four.4 = 1
   Four.5 = 0
   Four.6 = 0
   Four.7 = 1                                               '-90
Elseif Temp_ang < -1.8326 And Temp_ang > -2.3562 Then
   Ang = 10
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''163
   Four.4 = 0
   Four.5 = 1
   Four.6 = 0
   Four.7 = 1                                               '-120

Elseif Temp_ang < -2.3562 And Temp_ang > -2.8798 Then
   Ang = 11
   Four.0 = 1
   Four.1 = 1
   Four.2 = 0
   Four.3 = 0                                               ''179
   Four.4 = 1
   Four.5 = 1
   Four.6 = 0
   Four.7 = 1                                               '-150

Else

   Four.0 = 1
   Four.1 = 1
   Four.2 = 0                                               ''243
   Four.3 = 0
   Four.4 = 1
   Four.5 = 1
   Four.6 = 1
   Four.7 = 1                                               'stop

End If
')


If D6 > 200 Then
   Four.2 = 1
   Four.3 = 0
Elseif D6 < 50 Then
   Four.2 = 0
   Four.3 = 1
Else
   Four.2 = 0
   Four.3 = 0
End If


One.0 = 0
One.1 = 0                                                   ''l2 is 248
One.2 = D5.0
One.3 = D5.1
One.4 = D5.2
One.5 = D5.3                                                ''l1 is 236
One.6 = D5.4
One.7 = D5.5


Two.0 = 0
Two.1 = 1
Two.2 = D5.6
Two.3 = D5.7                                                ''square is 246
Two.4 = D4.0
Two.5 = D4.1                                                ''circle is 124
Two.6 = D4.2
Two.7 = D4.3


Three.0 = 1
Three.1 = 0
Three.2 = D4.4
Three.3 = D4.5                                              ''right     245
Three.4 = D4.6
Three.5 = D4.7                                              ''left  221
Three.6 = 1
Three.7 = 1


If D2 = &H73 Then

  Count1 = 0
 ' Printbin #1 , One
  'Waitms 50
  'Printbin #1 , Two
'  Waitms 50
'  Printbin #1 , Three
 ' Waitms 50
 ' Printbin #1 , Four
  'Waitms 50

Else

  Incr Count1

  If Count1 > 3 Then
  '  Printbin #1 , 252                                       '&B11100000
'    Waitms 50
   ' Printbin #1 , 254                                       '&B11100010
 '      Waitms 50
    'Printbin #1 , 253                                       '&B11100001
  '  Waitms 50
   ' Printbin #1 , 243                                       '&B11100011
   ' Waitms 50
  End If

End If

Loop


'++++++++++++++++++++++++++++++++++++++++           sender/receiver function            ++++++++++++++++++++++++++++++++++++++++

Sub Ps2(datum As Byte , Command As Byte)

  Dim A As Integer , C As Byte , D As Bit , E As Byte , B1 As Byte
  A = 1
  Datum = 0

  For A = 1 To 8
  Reset Clk

  B1 = Command Mod 2

  If B1 = 1 Then
    Set Cmd

  Elseif B1 = 0 Then
     Reset Cmd

  End If

  Waitus 2                                                  '2 kar dena baad me
  Set Clk
  Waitus 1

  D = Dat

  If D = 1 Then
    Datum = Datum + Binaryv(a)
  End If

  Command = Command / 2

  Next A

  Waitus 12

End Sub


End                                                         'end program
