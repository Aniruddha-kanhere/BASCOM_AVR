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

Dim T As Bit
Dim T1 As Bit
T = 0
T1 = Not T
Dim I As Integer
Dim J As Integer
Dim K As Integer
Dim X As Integer
Dim Y As Integer
Dim L As Integer
Dim H As Integer
Dim A As Integer
I = 0
J = 0
K = 0
X = 0
Y = 0
H = 0
L = 0

Declare Sub Forward()
Declare Sub Reverse()
Declare Sub Righturn()
Declare Sub Lefturn()
Declare Sub Stopit()
Declare Sub Middle()
Declare Sub Sensorupdate()
Declare Sub Algo1follower()
Declare Sub Algo2follower()
Declare Sub Algo3follower()
Declare Sub Simple()
Declare Sub Brain()
Declare Sub Brain.1()
Declare Sub Algo1()
Declare Sub Algo2()
Declare Sub Algo3()



Do
   Call Sensorupdate()
   If A = 2 Then
      Call Forward()
   Elseif A = 3 Then
      Call Forward()
   Elseif A = 4 Then
      Call Lefturn()
   Elseif A = 5 Then
      Call Lefturn()
   Elseif A = 6 Then
      Call Forward()
   Elseif A = 7 Then
         Call Righturn()
   Elseif A = 8 Then
      Call Righturn()
   Elseif A = 12 Then
      Call Reverse()
   Elseif A = 9 Then
      Cls
      Lcd "brain"
      Call Brain()
   Else
      Call Stopit()
   End If
Loop

         Sub Brain()
         Call Lefturn()
         Call Middle()
         Call Stopit()
         Cls
         Lcd "simple"
        Wait 2
         Call Simple()
         Call Stopit()
         Cls
         Lcd X
         Lowerline
         Lcd Y


         If X = 2 And Y = 1 Then
         Call Stopit()


         Call Algo3follower()
         Elseif X = 1 And Y = 2 Then

                  Cls
                  Lcd "brain1"
         Call Brain.1()
         Call Stopit()
         Cls
         Lcd H
         Lowerline
         Lcd L

         If L = 3 And H = 0 Then

         Call Algo1follower()
         Elseif L = 2 And H = 1 Then

         Call Algo2follower()
         End If
         End If
         End Sub

   Sub Simple()                                             '
   Do
   Call Sensorupdate()
   If A = 2 Then
   Call Forward()
   Elseif A = 3 Then
   Call Forward()
   Elseif A = 4 Then
   Call Lefturn()
   Elseif A = 5 Then
   Call Lefturn()
   Elseif A = 6 Then
   Call Forward()
   Elseif A = 7 Then
   Call Righturn()
   Elseif A = 8 Then
   Call Righturn()
   Elseif A = 12 Then
   Incr Y
   Cls
   Lcd Y
   Call Reverse()
   Elseif A = 9 Then
   Incr X
   Cls
   Lcd X
   Call Lefturn()
   End If
   If Y = 2 Then
       Exit Sub
   End If

   Loop Until X = 2
End Sub

Sub Brain.1()
 Do
 Call Sensorupdate()
 If A = 2 Then
 Call Forward()
 Elseif A = 3 Then
 Call Forward()
 Elseif A = 4 Then
 Call Lefturn()
 Elseif A = 5 Then
 Call Lefturn()
 Elseif A = 6 Then
 Call Forward()
 Elseif A = 7 Then
 Call Righturn()
 Elseif A = 8 Then
 Call Righturn()
 Elseif A = 12 Then
 Incr H
 Cls
 Lcd H
 Call Reverse()
 Elseif A = 9 Then
 Incr L
 Cls
 Lcd L
 Call Forward()
 End If
 If L = 0 And H = 3 Then
 Exit Sub
 Elseif L = 1 And H = 2 Then
 Exit Sub
 End If
 Loop
 End Sub

Sub Algo1follower()
Do
Call Sensorupdate()

If A = 2 Then
Call Forward()
Elseif A = 3 Then
Call Forward()
Elseif A = 4 Then
Call Lefturn()
Elseif A = 5 Then
Call Lefturn()
Elseif A = 6 Then
Call Forward()
Elseif A = 7 Then
Call Righturn()
Elseif A = 8 Then
Call Righturn()
Elseif A = 12 Then
Call Reverse()
Elseif A = 9 Then
Call Algo1()
Else
Call Stopit()
End If
Loop
End Sub Algo1follower()



Sub Algo1()
 Incr J
 Cls
Lcd "algo1"

Select Case J

Case 1 : Call Righturn()
           Call Middle()

Case 2 : Call Lefturn()
           Call Middle()

Case 3 : Call Lefturn()
            Call Middle()

Case 4 : Call Righturn()
            Call Middle()

Case 5 : Call Righturn()
            Call Middle()

Case 6 : Call Righturn()
            Call Middle()

Case 7 : Call Righturn()
            Call Middle()

Case 8 : Call Lefturn()
            Call Middle()

Case Else : Call Stopit()
End Select
End Sub Algo1()


Sub Algo2follower()
Do
Call Sensorupdate()

If A = 2 Then
Call Forward()
Elseif A = 3 Then
Call Forward()
Elseif A = 4 Then
Call Lefturn()
Elseif A = 5 Then
Call Lefturn()
Elseif A = 6 Then
Call Forward()
Elseif A = 7 Then
Call Righturn()
Elseif A = 8 Then
Call Righturn()
Elseif A = 12 Then
Call Reverse()
Elseif A = 9 Then
Call Algo2()
Else
Call Stopit()
End If
Loop

End Sub Algo2follower()

Sub Algo2()
 Incr I
Cls
Lcd "algo2"
Select Case I

Case 1 : Call Righturn()
         Call Middle()

Case 2 : Call Lefturn()
          Call Middle()

Case 3 : Call Lefturn()
          Call Middle()

Case 4 : Call Righturn()
           Call Middle()

Case 5 : Call Righturn()
          Call Middle()

Case 6 : Call Righturn()
           Call Middle()

Case 7 : Call Righturn()
           Call Middle()

Case 8 : Call Lefturn()
           Call Middle()

Case Else : Call Stopit()
End Select
End Sub Algo2()


Sub Algo3follower()
 Do
Call Sensorupdate()

If A = 2 Then
Call Forward()
Elseif A = 3 Then
Call Forward()
Elseif A = 4 Then
Call Lefturn()
Elseif A = 5 Then
Call Lefturn()
Elseif A = 6 Then
Call Forward()
Elseif A = 7 Then
Call Righturn()
Elseif A = 8 Then
Call Righturn()
Elseif A = 12 Then
Call Reverse()
Elseif A = 9 Then
Call Algo3()
Else
Call Stopit()
End If
Loop
End Sub Algo3follower()


Sub Algo3()
 Incr K
 Cls
 Lcd "algo3"
Select Case K

Case 1 : Call Forward()
           Call Middle()

Case 2 : Call Righturn()
          Call Middle()

Case 3 : Call Righturn()
           Call Middle()

Case 4 : Call Lefturn()
          Call Middle()


Case 5 : Call Lefturn()
          Call Middle()

Case 6 : Call Lefturn()
          Call Middle()

Case 7 : Call Lefturn()
           Call Middle()

Case 8 : Call Righturn()
          Call Middle()

Case Else : Call Stopit()
End Select
End Sub Algo3()


 Sub Sensorupdate()
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
End Sub Sensorupdate()


Sub Forward()
Set Portd.0
Reset Portb.4
Set Portd.2
Reset Portd.3
Cls
Lcd "forward "
End Sub Forward()

Sub Lefturn()
Reset Portd.0
Reset Portb.4
Set Portd.2
Reset Portd.3
Cls
Lcd "lefturn"
End Sub Lefturn()

Sub Righturn()
Set Portd.0
Reset Portb.4
Reset Portd.2
Reset Portd.3
Cls
Lcd "rigturn"
End Sub Righturn()

Sub Reverse()
Reset Portd.0
Set Portb.4
Set Portd.2
Reset Portd.3
Cls
Lcd "reverse"
End Sub Reverse()

Sub Stopit()
Reset Portd.0
Reset Portb.4
Reset Portd.2
Reset Portd.3
Cls
Lcd "lefturn"
End Sub Stopit()

Sub Middle()
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
End Sub Middle()


