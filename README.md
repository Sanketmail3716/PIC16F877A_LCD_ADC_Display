# PIC16F877A LCD ADC Display

This project demonstrates how to interface a 16x2 LCD with the PIC16F877A microcontroller to display analog sensor values using its built-in ADC. It is developed using MikroC PRO for PIC and reads analog input from channel AN0 and shows the converted digital value on the LCD.

---

## 📌 Features

- Reads analog input using ADC channel 0
- Displays converted digital value on 16x2 LCD
- 4-bit LCD communication
- Clean and modular code
- Adjustable delay for display refresh

---

## 🛠️ Hardware Requirements

- PIC16F877A Microcontroller  
- 16x2 LCD Display  
- Potentiometer or analog sensor for ADC input  
- Crystal Oscillator (e.g., 8MHz)  
- Power Supply (5V regulated)  
- Breadboard and jumper wires  

---

## 🧪 Circuit Connections

### LCD Connections (4-bit mode):

| LCD Pin | Microcontroller Pin |
|---------|---------------------|
| RS      | RC0                 |
| EN      | RC1                 |
| D4      | RD4                 |
| D5      | RD5                 |
| D6      | RD6                 |
| D7      | RD7                 |

### ADC Input:
- Connect analog sensor/potentiometer to **RA0 (AN0)**

---

## 💻 Software Used

- MikroC PRO for PIC
- PIC Flash Programmer (e.g., PICkit 2/3, or other ISP tool)

---

## 📂 Code Overview

```c
// LCD module connections
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

// Direction registers
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

Initializes LCD and ADC

Continuously reads analog value from AN0

Displays the ADC result as a 4-digit number on LCD

Line 1:      SANKET
Line 2:  ADC_Data1:1023
