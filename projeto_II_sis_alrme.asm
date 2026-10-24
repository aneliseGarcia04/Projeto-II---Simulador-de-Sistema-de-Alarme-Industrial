.data
    promptA: .asciiz "Digite o valor do Sensor A (Porta: 0=Fechada, 1=Aberta): "
    promptB: .asciiz "Digite o valor do Sensor B (Movimento: 0=Sem, 1=Com): "
    promptC: .asciiz "Digite o valor do Sensor C (Sistema: 0=Desligado, 1=Ligado): "
    msgSaida: .asciiz "Estado do Alarme (S): "

.text
.globl main

main:
    li $v0, 4           # syscall 4: imprimir string
    la $a0, promptA
    syscall
    
    li $v0, 5           # syscall 5: ler inteiro
    syscall
    move $t0, $v0       # $t0 armazena A

    li $v0, 4
    la $a0, promptB
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0       # $t1 armazena B

    li $v0, 4
    la $a0, promptC
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0       # $t2 armazena C
    
    or $t3, $t0, $t1    # $t3 = A OR B. O risco existe se a porta abrir OU houver movimento.
    
    and $t4, $t3, $t2   # $t4 = (A OR B) AND C. O alarme só soa se houver risco E o sistema estiver ligado.

    li $v0, 4
    la $a0, msgSaida
    syscall

    li $v0, 1           # syscall 1: imprimir inteiro
    move $a0, $t4       # Move o resultado final (S) para exibição
    syscall

    li $v0, 10          # syscall 10: sair
    syscall