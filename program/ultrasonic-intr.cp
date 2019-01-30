#line 1 "C:/Users/only try/Desktop/PROJET 17 Microcontroller (Ultrasonic with Interrupt )/program/ultrasonic-intr.c"

sbit LCD_RS at RB1_bit;
sbit LCD_EN at RB0_bit;
sbit LCD_D4 at RC5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_EN_Direction at TRISB0_bit;
sbit LCD_D4_Direction at TRISC5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;


unsigned int time;
char time_txt[8];
unsigned int distance , _distance;
char distance_txt[8];
bit flag;

void config ()
{
 ADCON1=0b00001111;

 TRISC.F3=0;
 TRISB.F5=0;
 TRISD.F0=0;
 TRISD.F1=0;
 TRISE.F3=1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"welcome");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"ultrasonic");
 delay_ms(1000);
 PORTD.F0=1;
 PORTD.F1=1;
 delay_ms(1000);
 PORTD.F0=0;
 PORTD.F1=0;
 delay_ms(1000);
 delay_ms(1);

 T1CON=0b00000000;
 RBIF_bit =1;
 RBIE_bit =1;
 PEIE_bit =1;
 GIE_bit =1;
}

void get_distsnce()
{
 TMR1H=0;
 TMR1L=0;
 PORTC.F3=1;
 delay_us(10);
 PORTC.F3=0;

 if(flag == 1 && _distance != distance)
 {
 _distance=distance;

 wordtostr(time,time_txt);
 wordtostr(distance,distance_txt);

 Ltrim(time_txt);
 Ltrim(distance_txt);

 if(distance>=10 && distance<=400)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,"time=");
 Lcd_Out(2,1,"distance=");
 Lcd_Out(2,6,time_txt);
 Lcd_Out(2,11,distance_txt);
 }
 else
 {
 Lcd_Cmd(_LCD_CLEAR);

 PORTD.F0=0;
 while(1)
 {
 Lcd_Out(3,3,"OUT OF RANGE!!!");
 PORTD.F1=1;
 delay_ms(100);
 Lcd_Out(3,3,"               ");
 PORTD.F1=0;
 delay_ms(100);
 }
 }
 flag=0;
 }

}

void main() {
config();
while (1)
{
get_distsnce();
}
}

void interrupt(){
 if (RBIF==1)
 {
 RBIE_bit=0;
 if (PORTB.F5==1)
 {
 TMR1ON_bit=1;
 }
 if (PORTB.F5==0)
 {
 TMR1ON_bit=0;
 time=((TMR1H << 8)+TMR1L);
 distance=(time/58)/2;
 flag=1;
 }
 RBIF_bit=0;
 RBIE_bit=1;
 }
}
