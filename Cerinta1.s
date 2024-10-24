.data
m: .space 4
n: .space 4
p: .space 4
linie: .space 4
coloana: .space 4
k: .space 4
decizie: .space 4
evolutie: .space 4
matrice: .space 1600
copie_matrice: .space 1600
i: .space 4
j: .space 4
nr: .space 4
mesaj: .space 25
len: .space 4
prefix: .asciz "0x"
formatcitire: .asciz "%d"
formatafisare: .asciz "%X"
#formatafisare2: .asciz " %d "
formatcitirestring: .asciz "%s"
formatafisarestring: .asciz "%s"
linienoua: .asciz "\n"
x: .asciz ""
.text
.global main
main:



#############################################################################
Citire_date:
pushl $m
pushl $formatcitire
call scanf
addl $8, %esp

pushl $n
pushl $formatcitire
call scanf
addl $8, %esp

pushl $p
pushl $formatcitire
call scanf
addl $8, %esp

incl m
incl m
incl n
incl n
 #maresc m si n cu 1  pentru a putea genera matricea extinsa

#integrez celulele vii
movl $0, %ecx
et_for1:
cmpl p, %ecx
je et_iesire_for1

pushl %ecx
pushl $linie
pushl $formatcitire
call scanf
addl $8, %esp
pop %ecx

pushl %ecx
pushl $coloana
pushl $formatcitire
call scanf
addl $8, %esp
popl %ecx

incl linie
incl coloana

lea matrice, %edi
movl n, %eax
movl $0, %edx
mull linie
addl coloana, %eax
movl $1, (%edi, %eax, 4)

incl %ecx
jmp et_for1
et_iesire_for1:

pushl $k
pushl $formatcitire
call scanf
addl $8, %esp

pushl $decizie
pushl $formatcitire
call scanf
addl $8, %esp

pushl $mesaj
pushl $formatcitirestring
call scanf
addl $8, %esp

#############################################################################
#Consider o copie a matricei initiale pentru a determina forma matricei dupa evolutie
Copierea_matricei:
movl $0, linie
et_for1_linie:
movl linie, %ecx
cmpl m, %ecx
je et_iesire_for1_linie
  movl $0, coloana
  et_for1_coloana:
  movl coloana, %ecx
  cmpl n, %ecx
  je et_iesire_for1_coloana
  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%edi, %eax, 4), %ebx

  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl %ebx, (%esi, %eax, 4)

  incl coloana
  jmp et_for1_coloana
et_iesire_for1_coloana:
incl linie
jmp et_for1_linie
et_iesire_for1_linie:



##############################################################################
Trecerea_prin_evolutii:
movl $0, evolutie
et_for_evolutii:
movl evolutie, %ecx
cmpl k, %ecx
je et_iesire_for_evolutii

movl $1, linie
et_for3_linie:
movl linie, %ecx
incl %ecx
cmpl m, %ecx
je et_iesire_for3_linie
  movl $1, coloana
  et_for3_coloana:
  movl coloana, %ecx
  incl %ecx
  cmpl n, %ecx
  je et_iesire_for3_coloana

  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%esi, %eax, 4), %ebx

  movl $0, nr #calculez numarul celulelor vii din jurul fiecarei celule existente

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  decl i
  decl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  decl i
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  decl i
  incl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  decl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  incl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  incl i
  decl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  incl i
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl linie, %eax
  movl %eax, i
  movl coloana, %eax
  movl %eax, j
  incl i
  incl j
  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull i
  addl j, %eax
  movl (%esi, %eax, 4), %ecx
  addl %ecx, nr

  movl nr, %ecx
  et_noua_stare_a_celulei:
  cmpl $2, %ecx
  je et_celula_ramane_la_fel
  cmpl $3, %ecx
  je et_celula_vie
  movl $0, %ebx
  jmp et_mergi_mai_departe
  et_celula_vie:
  movl $1, %ebx
  jmp et_mergi_mai_departe
  et_celula_ramane_la_fel:
  et_mergi_mai_departe:

  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl %ebx, (%edi, %eax, 4)


  incl coloana
  jmp et_for3_coloana
et_iesire_for3_coloana:
incl linie
jmp et_for3_linie
et_iesire_for3_linie:

et_noua_copie:
movl $0, linie
et_for4_linie:
movl linie, %ecx
cmpl m, %ecx
je et_iesire_for4_linie
  movl $0, coloana
  et_for4_coloana:
  movl coloana, %ecx
  cmpl n, %ecx
  je et_iesire_for4_coloana
  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%edi, %eax, 4), %ebx

  lea copie_matrice, %esi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl %ebx, (%esi, %eax, 4)

  incl coloana
  jmp et_for4_coloana
et_iesire_for4_coloana:
incl linie
jmp et_for4_linie
et_iesire_for4_linie:

incl evolutie
jmp et_for_evolutii
et_iesire_for_evolutii:

movl $0, %ecx
cmpl decizie, %ecx
je Criptare
jmp Decriptare


#########################################################################
Criptare:


pushl $mesaj
call strlen
addl $4, %esp
movl %eax, len

pushl $prefix
pushl $formatafisarestring
call printf
addl $8, %esp

pushl $0
call fflush
addl $4, %esp


movl $0, linie
movl $0, coloana
movl $0, i
et_for_mesaj:
movl len, %ecx
cmpl i, %ecx
je Exit
movl $mesaj, %edi
movl i, %ecx
movl $0, %ebx
movb (%edi, %ecx,1), %bl
movl $8, j
et_for_8elem_matrice:
movl $0, %ecx
cmpl j, %ecx
je et_iesire_for_8elem_matrice

et_for2_linie:
movl linie, %ecx
cmpl m, %ecx
je et_iesire_for2_linie
  et_for2_coloana:
  movl coloana, %ecx
  cmpl n, %ecx
  je et_iesire_for2_coloana
  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%edi, %eax, 4), %eax

  decl j
  movl j, %ecx
  shl %ecx, %eax
  xor %eax, %ebx
  incl j

  incl coloana
  decl j
  jmp et_for_8elem_matrice
et_iesire_for2_coloana:
movl $0, coloana

incl linie
jmp et_for2_linie
et_iesire_for2_linie:
movl $0, linie
jmp et_for2_linie
et_iesire_for_8elem_matrice:
xor %eax, %eax
movl %ebx, %eax
sarl $4, %ebx
pushl %eax
pushl %ebx
pushl $formatafisare
call printf
addl $8, %esp
popl %eax

pushl %eax
pushl $0
call fflush
addl $4, %esp
popl %eax

movl $16, %ebx
movl $0, %edx
divl %ebx
pushl %edx
pushl $formatafisare
call printf
addl $8, %esp

pushl $0
call fflush
addl $4, %esp


incl i
jmp et_for_mesaj



#######################################################################
Decriptare:

pushl $mesaj
call strlen
addl $4, %esp
movl %eax, len


movl $0, linie
movl $0, coloana
movl $2, i
et_for_mesajB:
movl len, %ecx
cmpl i, %ecx
je Exit

movl $mesaj, %edi
movl i, %ecx
movl $0, %eax
movb (%edi, %ecx,1), %al

cmpl $'9',%eax
jg et_litera
subl $'0', %eax
shll $4, %eax
jmp Pas2

et_litera:
subl $'A',%eax
addl $10, %eax
shll $4, %eax


Pas2:
incl i
movl $mesaj, %edi
movl i, %ecx
movl $0, %ebx
movb (%edi, %ecx,1), %bl

cmpl $'9',%ebx
jg et_litera2
subl $'0', %ebx
jmp Pas3

et_litera2:
subl $'A',%ebx
addl $10, %ebx

Pas3:
addl %ebx, %eax
movl %eax, %ebx



movl $8, j
et_for_8elem_matriceB:
movl $0, %ecx
cmpl j, %ecx
je et_iesire_for_8elem_matriceB

et_for2_linieB:
movl linie, %ecx
cmpl m, %ecx
je et_iesire_for2_linieB
  et_for2_coloanaB:
  movl coloana, %ecx
  cmpl n, %ecx
  je et_iesire_for2_coloanaB
  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%edi, %eax, 4), %eax

  decl j
  movl j, %ecx
  shl %ecx, %eax
  xor %eax, %ebx
  incl j

  incl coloana
  decl j
  jmp et_for_8elem_matriceB
et_iesire_for2_coloanaB:
movl $0, coloana

incl linie
jmp et_for2_linieB
et_iesire_for2_linieB:
movl $0, linie
jmp et_for2_linieB
et_iesire_for_8elem_matriceB:

addl %ebx, x
pushl $x
pushl $formatafisarestring
call printf
addl $8, %esp

pushl $0
call fflush
addl $4, %esp

subl %ebx, x


incl i
jmp et_for_mesajB



##############################################################################
Exit:
movl $4, %eax
movl $1, %ebx
movl $linienoua, %ecx
movl $2, %edx
int $0x80

pushl $0
call fflush
addl $4, %esp

movl $1, %eax
xor %ebx, %ebx
int $0x80

