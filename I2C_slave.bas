$regfile "m128def.dat"
$crystal = 16000000

Config Lcdpin = Pin , Rs = Porta.3 , E = Porta.4 , Db4 = Porta.5 , Db5 = Porta.6 , Db6 = Porta.7 , Db7 = Portg.2
Config Lcd = 16 * 2

Declare Sub I2c_reciever_init()
Declare Sub I2c_communicate()
Declare Sub Interrupt()

Config Portd = Output

Dim Readl(25) As Integer
Dim Readlength As Integer
Dim I2c_read(25) As Integer
Dim Flag As Integer
Dim B As Byte
Dim Value As Integer
Dim Addr As Byte
Dim Stat As Integer
Dim Temp As Integer
                                      
Enable Interrupts
Enable Twi
On Twi Interrupt


'///**************main ******************************************************************
Call I2c_reciever_init()

Do
    Call Interrupt()
      If Flag = 1 Then
          Cls
     Lcd Value
     End If

        Waitms 100
     Flag = 0                                               

Sub I2c_reciever_init()

Twar = $04
Set Twcr.twint
Set Twcr.twie
Set Twcr.twen
Set Twcr.twea
Reset Twcr.twsta
Reset Twcr.twsto

    Cls
    Lcd "initialised 69"
    Waitms 200

  End Sub I2c_reciever_init()



Sub Interrupt()

Temp = Twcr And 128

If Temp = &H80 Then
Stat = Twsr And &HF8

Select Case Stat

Case $60:
Addr = Twdr

Case $80:
  Value = Twdr
  Flag = 1

End Select
Twcr = &B11000100

End If
End Sub
