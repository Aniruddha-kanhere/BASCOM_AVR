$regfile "m8def.dat"
$baud = 19200
$crystal = 16000000
$hwstack = 32
$swstack = 10
$framesize = 40

Dim X As Integer
Dim Y As integer

Config Timer1 = Pwm , Pwm = 10 , Compare A Pwm = Clear Down , Compare B Pwm = Clear Down , Prescale = 1024

Do
Pwm1a = X
Incr X
Waitms 1
Loop Until X = 1024

Do
Pwm1b = Y
Incr Y
Waitms 100
Loop Until Y = 255

End                                                         'end program