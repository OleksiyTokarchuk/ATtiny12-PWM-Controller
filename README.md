# ATtiny12-PWM-Controller
ATtiny12 PWM controller with adjustable frequency based on timer overflow interrupt with software timer inside that implements duty cycle calculation (assembly language)
----------------------------------------------
USAGE:

Unprogram all CKSEL fuses and connect 8MHz crystal
Connect PB0 to osciloscope input
Connect to PB1 and PB2 buttons that will increase or decrease PWM duty cycle (buttons type NO connected to GND in pressed state)
Register "oc" contains values 0x02..0xFE that set minimum and maximum duty cycle
Main cycle reads buttons and sets PWM with software delay 50ms
Interrupt generates PWM wave
