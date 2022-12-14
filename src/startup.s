

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

// Global memory locations.
// .global makes these symbols available in
// other files
.global vector_table
.global Reset_Handler                                                                                                                                                                                                                                                                                                                           
         
/*
 * The actual vector table.
 * Only the size of RAM and 'reset' handler are
 * included, for simplicity.
 */
.section .vector_table,"a",%progbits
vtable:
    .word     _estack                    // Top of Stack
    .word     Reset_Handler              // Reset Handler
    .word     NMI_Handler                // NMI Handler
    .word     HardFault_Handler          // Hard Fault Handler
    .word     MemManage_Handler          // MPU Fault Handler
    .word     BusFault_Handler           // Bus Fault Handler
    .word     UsageFault_Handler         // Usage Fault Handler
    .word     0                          // Reserved
    .word     0                          // Reserved
    .word     0                          // Reserved
    .word     0                          // Reserved
    .word     SVC_Handler                // SVCall Handler
    .word     DebugMon_Handler           // Debug Monitor Handler
    .word     0                          // Reserved
    .word     PendSV_Handler             // PendSV Handler
    .word     SysTick_Handler            // SysTick Handler

    // External Interrupts
    .word     WWDG_IRQHandler                   // Window WatchDog                                        
    .word     PVD_IRQHandler                    // PVD through EXTI Line detection                        
    .word     TAMP_STAMP_IRQHandler             // Tamper and TimeStamps through the EXTI line            
    .word     RTC_WKUP_IRQHandler               // RTC Wakeup through the EXTI line                       
    .word     FLASH_IRQHandler                  // FLASH                                           
    .word     RCC_IRQHandler                    // RCC                                             
    .word     EXTI0_IRQHandler                  // EXTI Line0                                             
    .word     EXTI1_IRQHandler                  // EXTI Line1                                             
    .word     EXTI2_IRQHandler                  // EXTI Line2                                             
    .word     EXTI3_IRQHandler                  // EXTI Line3                                             
    .word     EXTI4_IRQHandler                  // EXTI Line4                                             
    .word     DMA1_Stream0_IRQHandler           // DMA1 Stream 0                                   
    .word     DMA1_Stream1_IRQHandler           // DMA1 Stream 1                                   
    .word     DMA1_Stream2_IRQHandler           // DMA1 Stream 2                                   
    .word     DMA1_Stream3_IRQHandler           // DMA1 Stream 3                                   
    .word     DMA1_Stream4_IRQHandler           // DMA1 Stream 4                                   
    .word     DMA1_Stream5_IRQHandler           // DMA1 Stream 5                                   
    .word     DMA1_Stream6_IRQHandler           // DMA1 Stream 6                                   
    .word     ADC_IRQHandler                    // ADC1, ADC2 and ADC3s                            
    .word     CAN1_TX_IRQHandler                // CAN1 TX                                                
    .word     CAN1_RX0_IRQHandler               // CAN1 RX0                                               
    .word     CAN1_RX1_IRQHandler               // CAN1 RX1                                               
    .word     CAN1_SCE_IRQHandler               // CAN1 SCE                                               
    .word     EXTI9_5_IRQHandler                // External Line[9:5]s                                    
    .word     TIM1_BRK_TIM9_IRQHandler          // TIM1 Break and TIM9                   
    .word     TIM1_UP_TIM10_IRQHandler          // TIM1 Update and TIM10                 
    .word     TIM1_TRG_COM_TIM11_IRQHandler     // TIM1 Trigger and Commutation and TIM11
    .word     TIM1_CC_IRQHandler                // TIM1 Capture Compare                                   
    .word     TIM2_IRQHandler                   // TIM2                                            
    .word     TIM3_IRQHandler                   // TIM3                                            
    .word     TIM4_IRQHandler                   // TIM4                                            
    .word     I2C1_EV_IRQHandler                // I2C1 Event                                             
    .word     I2C1_ER_IRQHandler                // I2C1 Error                                             
    .word     I2C2_EV_IRQHandler                // I2C2 Event                                             
    .word     I2C2_ER_IRQHandler                // I2C2 Error                                               
    .word     SPI1_IRQHandler                   // SPI1                                            
    .word     SPI2_IRQHandler                   // SPI2                                            
    .word     USART1_IRQHandler                 // USART1                                          
    .word     USART2_IRQHandler                 // USART2                                          
    .word     USART3_IRQHandler                 // USART3                                          
    .word     EXTI15_10_IRQHandler              // External Line[15:10]s                                  
    .word     RTC_Alarm_IRQHandler              // RTC Alarm (A and B) through EXTI Line                  
    .word     OTG_FS_WKUP_IRQHandler            // USB OTG FS Wakeup through EXTI line                        
    .word     TIM8_BRK_TIM12_IRQHandler         // TIM8 Break and TIM12                  
    .word     TIM8_UP_TIM13_IRQHandler          // TIM8 Update and TIM13                 
    .word     TIM8_TRG_COM_TIM14_IRQHandler     // TIM8 Trigger and Commutation and TIM14
    .word     TIM8_CC_IRQHandler                // TIM8 Capture Compare                                   
    .word     DMA1_Stream7_IRQHandler           // DMA1 Stream7                                           
    .word     FMC_IRQHandler                    // FMC                                             
    .word     SDIO_IRQHandler                   // SDIO                                            
    .word     TIM5_IRQHandler                   // TIM5                                            
    .word     SPI3_IRQHandler                   // SPI3                                            
    .word     UART4_IRQHandler                  // UART4                                           
    .word     UART5_IRQHandler                  // UART5                                           
    .word     TIM6_DAC_IRQHandler               // TIM6 and DAC1&2 underrun errors                   
    .word     TIM7_IRQHandler                   // TIM7                   
    .word     DMA2_Stream0_IRQHandler           // DMA2 Stream 0                                   
    .word     DMA2_Stream1_IRQHandler           // DMA2 Stream 1                                   
    .word     DMA2_Stream2_IRQHandler           // DMA2 Stream 2                                   
    .word     DMA2_Stream3_IRQHandler           // DMA2 Stream 3                                   
    .word     DMA2_Stream4_IRQHandler           // DMA2 Stream 4                                   
    .word     0                                 // Reserved                                        
    .word     0                                 // Reserved                      
    .word     CAN2_TX_IRQHandler                // CAN2 TX                                                
    .word     CAN2_RX0_IRQHandler               // CAN2 RX0                                               
    .word     CAN2_RX1_IRQHandler               // CAN2 RX1                                               
    .word     CAN2_SCE_IRQHandler               // CAN2 SCE                                               
    .word     OTG_FS_IRQHandler                 // USB OTG FS                                      
    .word     DMA2_Stream5_IRQHandler           // DMA2 Stream 5                                   
    .word     DMA2_Stream6_IRQHandler           // DMA2 Stream 6                                   
    .word     DMA2_Stream7_IRQHandler           // DMA2 Stream 7                                   
    .word     USART6_IRQHandler                 // USART6                                           
    .word     I2C3_EV_IRQHandler                // I2C3 event                                             
    .word     I2C3_ER_IRQHandler                // I2C3 error                                             
    .word     OTG_HS_EP1_OUT_IRQHandler         // USB OTG HS End Point 1 Out                      
    .word     OTG_HS_EP1_IN_IRQHandler          // USB OTG HS End Point 1 In                       
    .word     OTG_HS_WKUP_IRQHandler            // USB OTG HS Wakeup through EXTI                         
    .word     OTG_HS_IRQHandler                 // USB OTG HS                                      
    .word     DCMI_IRQHandler                   // DCMI  
    .word     0                                 // Reserved				                              
    .word     0                                 // Reserved
    .word     FPU_IRQHandler                    // FPU
    .word     0                                 // Reserved
    .word     0                                 // Reserved
    .word     SPI4_IRQHandler                   // SPI4
    .word     0                                 // Reserved
    .word     0                                 // Reserved
    .word     SAI1_IRQHandler                   // SAI1
    .word     0                                 // Reserved
    .word     0                                 // Reserved
    .word     0                                 // Reserved
    .word     SAI2_IRQHandler                   // SAI2
    .word     QUADSPI_IRQHandler                // QuadSPI
    .word     CEC_IRQHandler                    // CEC
    .word     SPDIF_RX_IRQHandler               // SPDIF RX
    .word     FMPI2C1_EV_IRQHandler             // FMPI2C Event
    .word     FMPI2C1_ER_IRQHandler             // FMPI2C Error  
  
  // (Location to boot from for RAM startup)
  #define boot_ram_base  0xF108F85F
  .word boot_ram_base
  /*
   * Setup weak aliases for each exception handler to the
   * default one. These can be updated later, or just
   * overridden since they're weak refs.
   * The reset_handler is set up separately.
   */
    .weak NMI_Handler  
    .thumb_set NMI_Handler,default_interrupt_handler
    .weak HardFault_Handler
    .thumb_set HardFault_Handler,default_interrupt_handler
    .weak MemManage_Handler
    .thumb_set MemManage_Handler,default_interrupt_handler
    .weak BusFault_Handler
    .thumb_set BusFault_Handler,default_interrupt_handler
    .weak UsageFault_Handler
    .thumb_set NMI_handler,default_interrupt_handler
    .weak SVC_Handler
    .thumb_set SVC_Handler,default_interrupt_handler
    .weak DebugMon_Handler
    .thumb_set DebugMon_Handler,default_interrupt_handler
    .weak PendSV_Handler
    .thumb_set PendSV_handler,default_interrupt_handler
    .weak SysTick_Handler 
    .thumb_set SysTick_handler,default_interrupt_handler
    .weak WWDG_IRQHandler
    .thumb_set WWDG_handler,default_interrupt_handler                                       
    .weak PVD_IRQHandler
    .thumb_set PVD_IRQHandler,default_interrupt_handler
    .weak TAMP_STAMP_IRQHandler
    .thumb_set PVD_IRQHandler,default_interrupt_handler
    .weak RTC_WKUP_IRQHandler
    .thumb_set RTC_WKUP_IRQHandler,default_interrupt_handler
    .weak FLASH_IRQHandler
    .thumb_set FLASH_IRQHandler,default_interrupt_handler                           
    .weak RCC_IRQHandler
    .thumb_set RCC_IRQHandler,default_interrupt_handler                                          
    .weak EXTI0_IRQHandler     
    .thumb_set EXTI0_IRQHandler,default_interrupt_handler                                       
    .weak EXTI1_IRQHandler
    .thumb_set EXTI1_IRQHandler,default_interrupt_handler                                        
    .weak EXTI2_IRQHandler
    .thumb_set EXTI2_IRQHandler,default_interrupt_handler
    .weak EXTI3_IRQHandler
    .thumb_set EXTI3_IRQHandler,default_interrupt_handler                                              
    .weak EXTI4_IRQHandler
    .thumb_set EXTI4_IRQHandler,default_interrupt_handler                                            
    .weak DMA1_Stream0_IRQHandler
    .thumb_set DMA1_Stream0_IRQHandler,default_interrupt_handler                                  
    .weak DMA1_Stream1_IRQHandler
    .thumb_set DMA1_Stream1_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream2_IRQHandler         
    .thumb_set DMA1_Stream2_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream3_IRQHandler
    .thumb_set DMA1_Stream3_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream4_IRQHandler                               
    .thumb_set DMA1_Stream4_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream5_IRQHandler
    .thumb_set DMA1_Stream5_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream6_IRQHandler
    .thumb_set DMA1_Stream6_IRQHandler,default_interrupt_handler                                          
    .weak  ADC_IRQHandler
    .thumb_set ADC_IRQHandler,default_interrupt_handler                                   
    .weak CAN1_TX_IRQHandler
    .thumb_set CAN1_TX_IRQHandler,default_interrupt_handler                                   
    .weak CAN1_RX0_IRQHandler
    .thumb_set CAN1_RX0_IRQHandler,default_interrupt_handler                                   
    .weak CAN1_RX1_IRQHandler
    .thumb_set CAN1_RX1_IRQHandler,default_interrupt_handler                                   
    .weak CAN1_SCE_IRQHandler
    .thumb_set CAN1_SCE_IRQHandler,default_interrupt_handler                                   
    .weak EXTI9_5_IRQHandler
    .thumb_set EXTI9_5_IRQHandler,default_interrupt_handler                                   
    .weak TIM1_BRK_TIM9_IRQHandler
    .thumb_set TIM1_BRK_TIM9_IRQHandler,default_interrupt_handler                                   
    .weak TIM1_UP_TIM10_IRQHandler
    .thumb_set TIM1_UP_TIM10_IRQHandler,default_interrupt_handler                                   
    .weak TIM1_TRG_COM_TIM11_IRQHandler
    .thumb_set TIM1_TRG_COM_TIM11_IRQHandler,default_interrupt_handler                                   
    .weak TIM1_CC_IRQHandler
    .thumb_set TIM1_CC_IRQHandler,default_interrupt_handler                                   
    .weak TIM2_IRQHandler
    .thumb_set TIM2_IRQHandler,default_interrupt_handler                                   
    .weak TIM3_IRQHandler
    .thumb_set TIM3_IRQHandler,default_interrupt_handler                                   
    .weak TIM4_IRQHandler
    .thumb_set TIM4_IRQHandler,default_interrupt_handler  
    .weak I2C1_EV_IRQHandler
    .thumb_set I2C1_EV_IRQHandler,default_interrupt_handler                                   
    .weak I2C1_ER_IRQHandler
    .thumb_set I2C1_ER_IRQHandler,default_interrupt_handler                                   
    .weak I2C2_EV_IRQHandler
    .thumb_set I2C2_EV_IRQHandler,default_interrupt_handler                                   
    .weak I2C2_ER_IRQHandler
    .thumb_set EXTI9_5_IRQHandler,default_interrupt_handler                                   
    .weak SPI1_IRQHandler
    .thumb_set SPI1_IRQHandler,default_interrupt_handler                                   
    .weak SPI2_IRQHandler
    .thumb_set SPI2_IRQHandler,default_interrupt_handler                                   
    .weak USART1_IRQHandler
    .thumb_set USART1_IRQHandler,default_interrupt_handler                                   
    .weak USART2_IRQHandler
    .thumb_set USART2_IRQHandler,default_interrupt_handler                                   
    .weak USART3_IRQHandler
    .thumb_set USART3_IRQHandler,default_interrupt_handler                                                                
    .weak EXTI15_10_IRQHandler   
    .thumb_set EXTI15_10_IRQHandler,default_interrupt_handler                                   
    .weak RTC_Alarm_IRQHandler
    .thumb_set RTC_Alarm_IRQHandler,default_interrupt_handler                                   
    .weak OTG_FS_WKUP_IRQHandler
    .thumb_set OTG_FS_WKUP_IRQHandler,default_interrupt_handler                                   
    .weak TIM8_BRK_TIM12_IRQHandler
    .thumb_set TIM8_BRK_TIM12_IRQHandler,default_interrupt_handler                                   
    .weak TIM8_UP_TIM13_IRQHandler
    .thumb_set TIM8_UP_TIM13_IRQHandler,default_interrupt_handler                                   
    .weak TIM8_TRG_COM_TIM14_IRQHandler
    .thumb_set TIM8_TRG_COM_TIM14_IRQHandler,default_interrupt_handler                                   
    .weak TIM8_CC_IRQHandler
    .thumb_set TIM8_CC_IRQHandler,default_interrupt_handler                                   
    .weak DMA1_Stream7_IRQHandler
    .thumb_set DMA1_Stream7_IRQHandler,default_interrupt_handler                                   
    .weak FMC_IRQHandler
    .thumb_set FMC_IRQHandler,default_interrupt_handler                                   
    .weak SDIO_IRQHandler
    .thumb_set SDIO_IRQHandler,default_interrupt_handler                                   
    .weak TIM5_IRQHandler
    .thumb_set TIM5_IRQHandler,default_interrupt_handler                                   
    .weak SPI3_IRQHandler
    .thumb_set SPI3_IRQHandler,default_interrupt_handler                                   
    .weak UART4_IRQHandler
    .thumb_set UART4_IRQHandler,default_interrupt_handler                                   
    .weak UART5_IRQHandler
    .thumb_set UART5_IRQHandler,default_interrupt_handler                                   
    .weak TIM6_DAC_IRQHandler
    .thumb_set TIM6_DAC_IRQHandler,default_interrupt_handler                                   
    .weak TIM7_IRQHandler
    .thumb_set TIM7_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream0_IRQHandler
    .thumb_set DMA2_Stream0_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream1_IRQHandler
    .thumb_set DMA2_Stream1_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream2_IRQHandler
    .thumb_set DMA2_Stream2_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream3_IRQHandler
    .thumb_set DMA2_Stream3_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream4_IRQHandler
    .thumb_set DMA2_Stream4_IRQHandler,default_interrupt_handler                                   
    .weak CAN2_TX_IRQHandler
    .thumb_set CAN2_TX_IRQHandler,default_interrupt_handler                                   
    .weak CAN2_RX0_IRQHandler
    .thumb_set CAN2_RX0_IRQHandler,default_interrupt_handler                                                                                 
    .weak CAN2_RX1_IRQHandler
    .thumb_set CAN2_RX1_IRQHandler,default_interrupt_handler                                                                              
    .weak CAN2_SCE_IRQHandler
    .thumb_set CAN2_SCE_IRQHandler,default_interrupt_handler                                                                                 
    .weak OTG_FS_IRQHandler
    .thumb_set OTG_FS_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream5_IRQHandler
    .thumb_set DMA2_Stream5_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream6_IRQHandler
    .thumb_set DMA2_Stream6_IRQHandler,default_interrupt_handler                                   
    .weak DMA2_Stream7_IRQHandler
    .thumb_set DMA2_Stream7_IRQHandler,default_interrupt_handler                                   
    .weak USART6_IRQHandler
    .thumb_set USART6_IRQHandler,default_interrupt_handler                                   
    .weak I2C3_EV_IRQHandler
    .thumb_set I2C3_IRQHandler,default_interrupt_handler                                   
    .weak I2C3_ER_IRQHandler
    .thumb_set I2C3_ER_IRQHandler,default_interrupt_handler                                   
    .weak OTG_HS_EP1_OUT_IRQHandler
    .thumb_set OTG_HS_EP1_OUT_IRQHandler,default_interrupt_handler                                   
    .weak OTG_HS_EP1_IN_IRQHandler
    .thumb_set OTG_HS_EP1_IN_IRQHandler,default_interrupt_handler                                                     
    .weak OTG_HS_WKUP_IRQHandler
    .thumb_set OTG_HS_WKUP_IRQHandler,default_interrupt_handler                                   
    .weak OTG_HS_IRQHandler
    .thumb_set OTG_HS_IRQHandler,default_interrupt_handler                                   
    .weak DCMI_IRQHandler
    .thumb_set DCMI_IRQHandler,default_interrupt_handler                                   
    .weak FPU_IRQHandler
    .thumb_set FPU_IRQHandler,default_interrupt_handler                                   
    .weak SPI4_IRQHandler
    .thumb_set SPI4_IRQHandler,default_interrupt_handler                                   
    .weak SAI1_IRQHandler
    .thumb_set SAI1_IRQHandler,default_interrupt_handler                                   
    .weak SPI4_IRQHandler
    .thumb_set SPI4_IRQHandler,default_interrupt_handler                                   
    .weak SAI1_IRQHandler
    .thumb_set SAI1_IRQHandler,default_interrupt_handler                                   
    .weak SAI2_IRQHandler
    .thumb_set SAI2_IRQHandler,default_interrupt_handler                                   
    .weak QUADSPI_IRQHandler
    .thumb_set QUADSPI_IRQHandler,default_interrupt_handler                                   
    .weak CEC_IRQHandler
    .thumb_set CEC_IRQHandler,default_interrupt_handler                                   
    .weak SPDIF_RX_IRQHandler
    .thumb_set SPDIF_RX_IRQHandler,default_interrupt_handler                                   
    .weak FMPI2C1_EV_IRQHandler
    .thumb_set FMPI2C1_EV_IRQHandler,default_interrupt_handler                                   
    .weak FMPI2C1_ER_IRQHandler
    .thumb_set FMPI2C1_IRQHandler,default_interrupt_handler                                   
.size vtable, .-vtable
/*
 * A 'Default' interrupt handler. This is where interrupts
 * which are not otherwise configured will go.
 * It is an infinite loop, because...well, we weren't
 * expecting the interrupt, so what can we do?
 */
.section .text.default_interrupt_handler,"ax",%progbits
default_interrupt_handler:
  default_interrupt_loop:
    B default_interrupt_loop
.size default_interrupt_handler, .-default_interrupt_handler

/*
    * The Reset handler. Called on reset.
    */
.type Reset_Handler, %function
Reset_Handler:
    // Set the stack pointer to the end of the stack.
    // The '_estack' value is defined in our linker script.
    LDR  r0, =_estack
    MOV  sp, r0

// Copy data from flash to RAM data init section.
// R2 will store our progress along the sidata section.
MOVS r0, #0
// Load the start/end addresses of the data section,
// and the start of the data init section.
LDR  r1, =_sdata
LDR  r2, =_edata
LDR  r3, =_sidata
B    copy_sidata_loop
copy_sidata:
    // Offset the data init section by our copy progress.
    LDR  r4, [r3, r0]
    // Copy the current word into data, and increment.
    STR  r4, [r1, r0]
    ADDS r0, r0, #4
copy_sidata_loop:
    // Unless we've copied the whole data section, copy the
    // next word from sidata->data.
    ADDS r4, r0, r1
    CMP  r4, r2
    BCC  copy_sidata
// Once we are done copying the data section into RAM,
// move on to filling the BSS section with 0s.
MOVS r0, #0
LDR  r1, =_sbss
LDR  r2, =_ebss
B    reset_bss_loop
// Fill the BSS segment with '0's.
reset_bss:
    // Store a 0 and increment by a word.
    STR  r0, [r1]
    ADDS r1, r1, #4
reset_bss_loop:
    // We'll use R1 to count progress here; if we aren't
    // done, reset the next word and increment.
    CMP  r1, r2
    BCC  reset_bss
b main
.size Reset_Handler, .-Reset_Handler