.data
num1: .word 3
num2: .word 7
cad1: .asciiz "Introduce el numero A: "
cad2: .asciiz "Introduce el numero B: "
cad3: .asciiz "Introduce el numero C: "
cad4: .asciiz "Introduce el numero D: "
S1: .asciiz "El resultado de A + B es: "
S2: .asciiz "El resultado de C - D es: "
S3: .asciiz "El resultado de A + B + C + D es: "
salto: .asciiz "\n"

.globl main
.text
main:

li $v0, 4
la $a0, cad1 #Imprime la cadena 1
syscall

li $v0, 5 #Lee el numero A
syscall 
move $t0, $v0

li $v0, 4
la $a0, cad2 #Imprime la cadena 2
syscall

li $v0, 5 #Lee el numero B
syscall
move $t1, $v0

li $v0, 4
la $a0, cad3 #Imprime la cadena 3
syscall

li $v0, 5 #Lee el numero C
syscall
move $t2, $v0

li $v0, 4
la $a0, cad4 #Imprime la cadena 4
syscall

li $v0, 5 #Lee el numero D
syscall
move $t3, $v0

add $t4, $t0, $t1 #Suma A con B

li $v0, 4
la $a0, S1 #Imprime la cadena S1
syscall

li $v0, 1
move $a0, $t4 #Imprime el resultado de la suma
syscall

sub $t5, $t2, $t3 #Resta C y D y lo guarda en t5

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

add $t6, $t0, $t1 #Suma A B C y D y lo guarda en t6

li $v0, 4
la $a0, S2 #Imprime la cadena S3
syscall

li $v0, 1
move $a0, $t6 #Imprime el resultado de la suma
syscall

li $v0, 10