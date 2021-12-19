# ATtiny12-PWM-Controller
ATtiny12 PWM controller with adjustable frequency based on timer overflow interrupt with software timer inside that implements duty cycle calculation (assembly language)
----------------------------------------------
USAGE:<br />

Unprogram all CKSEL fuses and connect 8MHz crystal<br />
Connect PB0 to osciloscope input<br />
Connect to PB1 and PB2 buttons that will increase or decrease PWM duty cycle (buttons type NO connected to GND in pressed state)<br />
Register "oc" contains values 0x02..0xFE that set minimum and maximum duty cycle<br />
Main cycle reads buttons and sets PWM with software delay 50ms<br />
Interrupt generates PWM wave<br />
