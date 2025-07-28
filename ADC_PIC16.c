// LCD module connections
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD module connections

char i;                              // Loop variable

void Move_Delay() {                  // Function used for text moving
  Delay_ms(500);                     // You can change the moving speed here
}

unsigned int temp_res;

void main() {
    ADC_Init();
     Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,6,"SANKET");                 // Write text in first row

  Lcd_Out(2,2,"ADC_Data1:");                 // Write text in second row


  TRISA  = 0xff;              // PORTA is input


  do {
    temp_res = ADC_Read(0);
     Lcd_Cmd(0XCB);
    Lcd_Chr_Cp(temp_res/1000+'0');
    Lcd_Chr_Cp(((temp_res/100)%10)+'0');
    Lcd_Chr_Cp(((temp_res/10)%10)+'0');
    Lcd_Chr_Cp((temp_res%10)+'0');


  } while(1);
}