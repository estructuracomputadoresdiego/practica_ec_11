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
S4: .asciiz "A al cuadrado es: "
S5: .asciiz "El desplazamiento de 3 bits de A es: "
S6: .asciiz "El resto de dividir 7 entre 3 es: "
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

li $v0, 4
la $a0, salto
syscall

add $t4, $t0, $t1 #Suma A con B

li $v0, 4
la $a0, S1 #Imprime la cadena S1
syscall

li $v0, 1
move $a0, $t4 #Imprime el resultado de la suma
syscall

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

sub $t5, $t2, $t3 #Resta C y D y lo guarda en t5

li $v0, 4
la $a0, S2 #Imprime la cadena S2
syscall

li $v0, 1
move $a0, $t5 #Imprime el resultado de la resta
syscall

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

add $t4, $t4, $t2 #Suma A B C y lo guarda en t4
add $t4, $t4, $t3 #Suma A B C D y lo guarda en t4

li $v0, 4
la $a0, S3 #Imprime la cadena S3
syscall

li $v0, 1
move $a0, $t4 #Imprime el resultado de la suma
syscall

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

mul $t6, $t0, $t0 #Multiplica A por A y lo almacena en t6

li $v0, 4
la $a0, S4 #Imprime la cadena S4
syscall

li $v0, 1
move $a0, $t6 #Imprime el resultado de A por A
syscall

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

lw $t5, num1 #Almacena un 3 en t5 para hacer el salto de 3 bits
sllv $t4, $t0, $t5 #Salto a la izquierda de 3 bits de t0 almacenado en t4

li $v0, 4
la $a0, S5 #Imprime la cadena S5
syscall

li $v0, 1
move $a0, $t4 #Imprime el salto de 3 bits a la izquierda de A
syscall

li $v0, 4
la $a0, salto #Imprime la cadena salto
syscall

lw $t6, num2
div $t6, $t5 #Guarda el resto de la divion en t4
mfhi $t4

li $v0, 4
la $a0, S6 #Imprime la cadena S6
syscall

li $v0, 1
move $a0, $t4 #Imprime el resto de dividir 7 entre 3
syscall

li $v0, 10 #Exit
