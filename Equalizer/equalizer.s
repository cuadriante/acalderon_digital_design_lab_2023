_frequencies:
mov R9, #0
ldr R7, =307200 @ total pixels to analyze
ldr R4, =frequency_array
b _frequency_row

_frequency_row:
cmp R9, #256
beq _accumulate_frequencies
mov R8, #0
mov R2, #0

_frequency_column:
cmp R8, R7
beq _pass_frequencies
ldr R10, =memory_ROM
add R10, R10, R8
mov R1, #0
ldrb R1, [R10]
cmp R1, R9
addeq R2, R2, #1
add R8, R8, #1
b _frequency_column

_pass_frequencies:
strb R2, [R4, #0]
add R4, R4, #1
add R9, R9, #1
b _frequency_row
