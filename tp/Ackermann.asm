# Trabalho Pratico de Organizacao e Arquitetura de Processadores
#============ MACROS ============
.macro PRINT_STRING (%addr)
    li $v0, 4          
    la $a0, %addr      
    syscall
.end_macro

.macro READ_INT
    li $v0, 5          
    syscall
.end_macro

#============ SEGMENTO DE DADOS ============
.data
msg_inicial:  .asciiz "Variante da Função de Ackermann - 25/09/2025\n"
msg_autores:  .asciiz "Autores: Gustavo Flores e Otávio Kozak\n\n"
msg_prompt:   .asciiz "Digite os parâmetros m e n para calcular A(m,n) ou número negativo para abortar a execução\n"
msg_m:        .asciiz "m: "
msg_n:        .asciiz "n: "
msg_resultado1: .asciiz "A("
msg_virgula:  .asciiz ", "
msg_resultado2: .asciiz ") = "
msg_newline:  .asciiz "\n\n"
msg_fim:      .asciiz "Execução encerrada.\n"

#============ SEGMENTO DE TEXTO (CODIGO) ============
.text
.globl main

main:
    PRINT_STRING(msg_inicial)
    PRINT_STRING(msg_autores)

loop_start:
    PRINT_STRING(msg_prompt)
    
    PRINT_STRING(msg_m)
    READ_INT
    move $s0, $v0      # salva m

    PRINT_STRING(msg_n)
    READ_INT
    move $s1, $v0      # salva n

    # verifica se algum numero eh negativo
    bltz $s0, exit     
    bltz $s1, exit     

    # prepara argumentos e chama ackermann
    move $a0, $s0      
    move $a1, $s1      
    jal ackermann

    move $s2, $v0      # salva resultado

    # mostra resultado no formato "A(m,n) = resultado"
    PRINT_STRING(msg_resultado1)
    
    li $v0, 1          
    move $a0, $s0
    syscall

    PRINT_STRING(msg_virgula)

    li $v0, 1
    move $a0, $s1
    syscall

    PRINT_STRING(msg_resultado2)

    li $v0, 1
    move $a0, $s2
    syscall

    PRINT_STRING(msg_newline)

    j loop_start       

exit:
    PRINT_STRING(msg_fim)
    li $v0, 10         
    syscall

# funcao ackermann(m, n)
ackermann:
    # aloca espaco na pilha
    addi $sp, $sp, -12
    sw $ra, 8($sp)     
    sw $a0, 4($sp)     
    sw $a1, 0($sp)     

    # caso 1: se m = 0, retorna n + 1
    bne $a0, $zero, m_maior_que_0
    addi $v0, $a1, 1   
    j ackermann_end    

m_maior_que_0:
    # caso 2: se m > 0 e n = 0, retorna A(m-1, 1) + 1
    bne $a1, $zero, m_e_n_maior_que_0
    addi $a0, $a0, -1  
    li $a1, 1          
    jal ackermann      
    addi $v0, $v0, 1   
    j ackermann_end

m_e_n_maior_que_0:
    # caso 3: se m > 0 e n > 0, retorna A(m-1, A(m,n-1))
    addi $a1, $a1, -1  
    jal ackermann      

    move $a1, $v0      # resultado vira novo n
    lw $a0, 4($sp)     # recupera m original
    addi $a0, $a0, -1  

    jal ackermann      

ackermann_end:
    # restaura registradores da pilha
    lw $a1, 0($sp)
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12  

    jr $ra
