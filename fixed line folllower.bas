
$regfile "m8def.dat"
$crystal = 16000000


Config Pind.4 = Input
Config Pind.5 = Input
Config Pind.6 = Input
Config Pind.7 = Input
Config Pinb.0 = Input
Config Pinb.1 = Input
Config Pinb.2 = Input
Config Pinb.3 = Input
Config Portd.0 = Output
Config Portd.2 = Output
Config Portb.4 = Output
Config Portd.3 = Output
Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , Rs = Portc.0 , E = Portc.1
Config Lcd = 16 * 2

Dim J As Integer
Dim A As Integer
Dim T As Bit
Dim T1 As Bit
T = 0
T1 = Not T
J = 0
Do

If Pinb.0 = T And Pind.7 = T Then
A = 2
Elseif Pinb.0 = T And Pinb.1 = T Then
A = 3
Elseif Pinb.1 = T And Pinb.2 = T Then
A = 4
Elseif Pinb.2 = T And Pinb.3 = T Then
A = 5
Elseif Pind.7 = T And Pind.6 = T Then
A = 6
Elseif Pind.6 = T And Pind.5 = T Then
A = 7
Elseif Pind.4 = T And Pind.5 = T Then
A = 8
End If

If Pinb.0 = T And Pind.7 = T Then
If Pind.5 = T And Pind.6 = T Then
If Pinb.2 = T And Pinb.1 = T Then
If Pind.4 = T And Pinb.3 = T Then
A = 9
End If
End If
End If
End If


If Pinb.0 = T1 And Pind.7 = T1 Then
If Pind.5 = T1 And Pind.6 = T1 Then
If Pinb.2 = T1 And Pinb.1 = T1 Then
If Pind.4 = T1 And Pinb.3 = T1 Then
A = 12
End If
End If
End If
End If

If A = 2 Then
Gosub Forward
Elseif A = 3 Then
Gosub Forward
Elseif A = 4 Then
Gosub Lefturn
Elseif A = 5 Then
Gosub Lefturn
Elseif A = 6 Then
Gosub Forward
Elseif A = 7 Then
Gosub Righturn
Elseif A = 8 Then
Gosub Righturn
Elseif A = 12 Then
Gosub Reverse
Elseif A = 9 Then
Gosub Eight
Else
Gosub Stopit
End If
Loop

Eight:

 Incr J


Select Case J

Case 1 : Gosub Righturn
Do
If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 2 : Gosub Lefturn
Do
 If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 3 : Gosub Lefturn
Do
  If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 4 : Gosub Righturn
Do
 If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 5 : Gosub Righturn
Do
If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 6 : Gosub Righturn
Do
 If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 7 : Gosub Righturn
Do
If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case 8 : Gosub Lefturn
Do
 If Pind.7 = T1 And Pinb.0 = T1 Then
A = 12
End If
If Pind.7 = T And Pinb.0 = T Then
If A = 12 Then
A = 2
End If
End If
Loop Until A = 2

Case Else : Gosub Stopit
End Select
Return


Lefturn:
Set Portd.2
Reset Portd.3
Reset Portb.4
Reset Portd.0
Cls
Lcd "lefturn"
Return

Righturn:
Reset Portd.2
Reset Portd.3
Reset Portb.4
Set Portd.0
Cls
Lcd "righturn"
Return

Forward:
Set Portd.0
Set Portd.2
Reset Portd.3
Reset Portb.4
Cls
Lcd "forward"
Return

Reverse:
Reset Portd.2
Set Portd.3
Set Portb.4
Reset Portd.0
Cls
Lcd "reverse"
Return

Stopit:
Reset Portd.2
Reset Portd.3
Reset Portb.4
Reset Portd.0
Cls
Lcd "stopit"
Return



End                                                         'end program