BITS 32
EXTERN atoi, Cis_palindrome, printf, fact


GLOBAL addstr, is_palindrome, palindrome_check, factstr
;GLOBAL factstr
;GLOBAL palindrome_check
SECTION .data
    stringMsg DB 'Please enter a string: ', 10 ;first response message
    lenStringMsg EQU $-stringMsg ;length of first message
    string1 DB '%d'
SECTION .bss
    string RESB 1024
SECTION .text
addstr:
    push ebp
    mov ebp, esp

    push ebx
    push edx
    push esi
    
    mov esi, [ebp + 8] ;first string
    push esi
    call atoi
    add esp, 4
    mov ebx, eax ;first string converted into int pushed into ebx
    
    mov esi, [ebp + 12] ;second string
    push esi
    call atoi
    add esp, 4
    mov edx, eax ;second string converted into int pushed into ecx

    add ebx, edx
    mov eax, ebx
    
    push eax
    push string1
    call printf
    add esp, 8

    pop esi
    pop edx
    pop ebx
    pop ebp
    ret

is_palindrome:
    push ebp
    mov ebp, esp
    pushf
    push ecx
    push ebx
    push esi
    push edx
    pushf
    xor eax, eax
    mov ebx, [ebp + 8]
    mov esi, [ebp + 8]
    xor ecx, ecx
    find_end:
        cmp BYTE [esi], 10
        jz go_next
        inc cx
        inc esi
        jmp find_end
    go_next:
        xor eax, eax
        dec esi
        mov ax, cx
        mov dl, 2
        div dl
        cmp al, 0
        jz true
        mov cl, al
    looper:
        mov al, [esi] 
        cmp  byte al, [ebx] ;compare 2 characters
        jne false ;if not equal print out not a palindrome
        inc bl ;go to next char
        dec esi ;go to next char
        loop looper ;loop through again
    true:
        popf
        pop edx
        pop esi
        pop ebx
        pop ecx
        popf
        pop ebp
        mov eax, 1
        ret
    false:
        popf
        pop edx
        pop esi
        pop ebx
        pop ecx
        popf
        pop ebp
        mov eax, 0
        ret

factstr:
    push ebp
    mov ebp, esp
    push ebx
    pushf
    mov ebx, [ebp + 8]
    push ebx
    call atoi
    add esp, 4

    push eax
    call fact
    add esp, 4

    popf
    pop ebx
    pop ebp
    ret


palindrome_check:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    pushf

    mov eax, 4  
    mov ebx, 1
    mov ecx, stringMsg
    mov edx, lenStringMsg
    int 80h

    mov eax, 3  ;read in user's input
    mov ebx, 2
    mov ecx, string ; message to be read stored into 'string'
    mov edx, 1024
    int 80h

    push string
    call Cis_palindrome
    add esp, 4

    popf
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret


