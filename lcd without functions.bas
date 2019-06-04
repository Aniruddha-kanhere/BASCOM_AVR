$regfile "m128def.dat"
$crystal = 12000000
'$baud = 19200
'$framesize = 40

Config Portc = Output
Config Porta = Output
config portg=output

'Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
'Config Lcd = 16 * 2

Dim A As Byte
Dim B As Integer
Dim C As Integer
'B = 0
'Dim Q As String * 25
Dim F As Integer
'
'Dim Ar(8) As String * 15
 Dim D As Integer
 Dim G As Integer
 Dim K As Byte
 Dim L As Integer
 Dim M As Integer
 Dim N As Integer
 Dim O As Integer

 Db4 Alias Porta.5
Db5 Alias Porta.6
Db6 Alias Porta.7
Db7 Alias Portg.2
Rs Alias Porta.3
E Alias Porta.4


Declare Sub Clearit()
Declare Sub Cursoranddisplay()
Declare Sub Functionset()
Declare Sub Entrymode()
Declare Sub Lcd_write(byval Char As Byte)

'''''''''''''''''''''''''''''''''''''''''''''''''''
 Dim Q As String * 25
Dim Arr(10) As Byte
 Do

 Waitms 100
Call Functionset()
Call Cursoranddisplay()
Call Entrymode()
Call Clearit()

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''main'''''''''''''''''''''''''''''''''''''''''


F = -223

'(While F <> 0
A = F Mod 10
K = Asc(a)

Call Lcd_write()
Waitms 1
F = F / 10
Wend
')

Call Clearit()
'Q = "hello tak"

If F > 0 Then

Q = Str(f)

L = Split(q , Arr(1) , "")
L = Len(q)

For M = 1 To L



Call Lcd_write(arr(m))
Next

Elseif F < 0 Then



'Call Lcd_write(196)
 Arr(1) = "-"
 Q = Str(f)

L = Split(q , Arr(1) , "")
L = Len(q)

For M = 1 To L
  Set Rs

Call Lcd_write(arr(m))
Next

 End If
     Loop


        End                                                 'end program
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''





'''''''''''clearit '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub Clearit()

Reset Rs
Set E

Reset Db4
Reset Db5
Reset Db6
Reset Db7
 Waitms 1
Reset E
 Waitus 1
Set E

Set Db4
Reset Db5
Reset Db6
Reset Db7

Waitms 1
Reset E
Waitms 1
Set Rs
End Sub


'''''''''''''cursor '''''''''''''''''''''''''''''''''''''
Sub Cursoranddisplay()


Reset Rs
Set E

Reset Db4
Reset Db5
Reset Db6
Reset Db7
 Waitms 1
Reset E
Waitus 1

Set E

Set Db4
Set Db5
Set Db6
Set Db7
Waitms 1
Reset E
Waitms 1
Set Rs
Call Clearit()
End Sub
'''''''''''''''''''''''''''''function''''''''''''''''''''''''

Sub Functionset()
Reset Rs
Set E

Reset Db4
Set Db5
Reset Db6
Reset Db7
 Waitms 1
Reset E

Waitus 1
Set E


Set Db6
Reset Db7
Waitms 1
Reset E
Waitms 1
Set Rs
Call Clearit()
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''entry mode'''''''''''''''''''''''''''''''''''''
  Sub Entrymode()
Reset Rs
Set E

Reset Db4
Reset Db5
Reset Db6
Reset Db7
 Waitms 1
Reset E

Set E

Reset Db4
Set Db5
Set Db6
Reset Db7
Waitms 1
Reset E
Waitms 1
Set Rs
Call Clearit()
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''byval''''''''''''''''''''''''''''''''
Sub Lcd_write(byval Char As Byte)


Set Rs
Reset E
Waitms 1
Set E

Db4 = Char.4
Db5 = Char.5
Db6 = Char.6
Db7 = Char.7

Reset E
Waitus 1
Set E

Db4 = Char.0
Db5 = Char.1
Db6 = Char.2
Db7 = Char.3

Reset E
Waitus 2
Set Rs
Waitms 1


End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''