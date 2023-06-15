.text
.global _start

_start:
ldr R0, =pixelList
mov R1, #2
mov R7, #5
swi 0
add R8, R0, #0
ldr R9, =65025
b _loadROM

_loadROM:
cmp R9, #0
beq _loadPixels
sub R9, R9, #1
ldr R1, =converter
mov R2, #3
mov R7, #3
swi 0
bl _strToInt
ldr R2, =ROMMem
add R2, R2, R5
add R5, R5, #1
strb R4, [R2, #0]
b _loadROM

_loadPixels:
cmp R9, #255
beq _frequencies
ldr R0, =maxPixelValue
strb R9, [R0, R9]
add R9, R9, #1
b _loadPixels


_frequencies:
mov R9, #0
ldr R7, =65025 @ total pixels to analyze
ldr R4, =frequency_table1
b _frequency_row

_frequency_row:
cmp R9, #256
beq _accumulate_frequencies
mov R8, #0
mov R2, #0

_frequency_column:
cmp R8, R7
beq _pass_frequencies
ldr R10, =ROMMem
add R10, R10, R8
mov R1, #0
ldrb R1, [R10]
cmp R1, R9
addeq R2, R2, #1
add R8, R8, #1
b _frequency_column

_pass_frequencies:
strb R2, [R4, #0]
add R4, R4, #4
add R9, R9, #1
b _frequency_row

_accumulate_frequencies:
mov R9, #0
ldr R2, =frequency_table1
ldr R3, =frequency_accumulator
mov R4, #0
mov R5, #0
b _accumulate_frequencies_aux

_accumulate_frequencies_aux:
cmp R9, #256
beq _frequency_distribution
add R9, R9, #1
ldr R4, [R2, #0]
add R2, R2, #4
add R5, R5, R4
str R5, [R3, #0]
add R3, R3, #4
b _accumulate_frequencies_aux

_frequency_distribution:
mov R9, #0
ldr R1, =255
ldr R2, =frequency_table3
ldr R3, =frequency_accumulator2
mov R4, #0
bl _frequency_distribution_aux
ldr R9, =65025
sub R5, R9, R4
str R5, [R2, #0]
str R9, [R3, #0]
b _initialMapping

_frequency_distribution_aux:
cmp R9, #254
bxeq lr
strb R1, [R2, #0]
add R4, R4, R1
str R4, [R3, #0]
add R2, R2, #4
add R3, R3, #4
add R9, R9, #1
b _frequency_distribution_aux

_loadToFinal:
ldr R0, =newPixelList
mov R1, #2
mov R7, #5
swi 0
add R6, R0, #0
ldr R9, =65025
mov R3, #0
b _loadToFinalAux

_loadToFinalAux:
add R0, R6, #0
cmp R9, #0
beq _final
sub R9, R9, #1
ldr R1, =ROMMem
add R1, R1, R3
mov R10, #0
ldrb R10, [R1, #0]
bl _intToStr
ldr R1, =auxiliary
add R3, R3, #1
mov R2, #8
mov R7, #4
swi 0
add R0, R6, #0
ldr R1, =jump
mov R2, #1
mov R7, #4
swi 0
b _loadToFinalAux

_initialMapping:
mov R9, #0
ldr R0, =byteMapping
ldr R6, =frequency_accumulator
b _initialMappingRow

_initialMappingRow:
cmp R9, #255
beq _remapFinal
add R9, R9, #1
mov R8, #0
ldr R5, [R6, #0]
add R6, R6, #4
ldr R4, =frequency_accumulator2
ldr R7, =differenceList
b _initialMappingColumn

_initialMappingColumn:
cmp R8, #255
beq _findSmallest
add R8, R8, #1
ldr R1, [R4, #0]
cmp R1, R5
sublt R10, R5, R1
subgt R10, R1, R5
str R10, [R7]
add R7, R7, #4
add R4, R4, #4
b _initialMappingColumn

_findSmallest:
ldr R7, =differenceList
ldr R4, =65025
mov R8, #0
mov R11, #0
b _findSmallestAux

_findSmallestAux:
cmp R8, #255
beq _pixelStringMap
ldr R10, [R7]
add R7, R7, #4
cmp R4, R10
addgt R4, R10, #0
addgt R11, R8, #0
add R8, R8, #1
b _findSmallestAux

_pixelStringMap:
strb R11, [R0, #0]
add R0, R0, #1
mov R8, #0
b _initialMappingRow

_remapFinal:
ldr R0, =ROMMem
ldr R1, =65025
b _remapFinalAux

_remapFinalAux:
cmp R1, #0
beq _loadToFinal
ldrb R2, [R0, #0]
mov R3, #0
ldr R4, =byteMapping
bl _remapFinalAux2
add R0, R0, #1
sub R1, R1, #1
b _remapFinalAux

_remapFinalAux2:
cmp R3, #255
bxeq lr
cmp R3, R2
ldreqb R8, [R4]
streqb R8, [R0]
add R4, R4, #1
add R3, R3, #1
b _remapFinalAux2

_strToInt:
ldr R11, =converter
ldrb R1, [R11, #2]
sub R4, R1, #'0'
ldr R11, =converter
ldrb R1, [R11, #1]
mov R11, #10
sub R1, R1, #'0'
mul R6, R1, R11
add R4, R4, R6
ldr R11, =converter
ldrb R1, [R11, #0]
mov R11, #100
sub R1, R1, #'0'
mul R6, R1, R11
add R4, R4, R6
bx lr

_intToStr:
lsl R10, R10, #24
lsr R10, R10, #24
ldr R12, =auxiliary
mov R1, #0
add R1, R10, #0
lsl R1, R1, #24
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #0]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #25
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #1]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #26
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #2]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #27
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #3]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #28
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #4]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #29
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #5]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #30
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #6]
mov R1, #0
add R1, R10, #0
lsl R1, R1, #31
lsr R1, R1, #31
add R1, R1, #'0'
strb R1, [R12, #7]
bx lr

_final:
mov R7, #1
swi 0



.data

jump: .asciz "\n"
pixelList: .asciz "pixels_file.txt"
newPixelList: .asciz "remappedFile.txt"
differenceList: .space 1020, 0
frequency_table1: .space 1020, 0
frequency_accumulator: .space 1020, 0
frequency_table3: .space 1020, 0
frequency_accumulator2: .space 1020, 0
total: .4byte 65025
byteMapping: .space 255, 0
maxPixelValue: .byte 255
auxiliary: .asciz "00000000"
converter: .asciz "000"
ROMMem: .space 65025, 0
