.data
m: .space 4
n: .space 4
p: .space 4
linie: .space 4
coloana: .space 4
k: .space 4
evolutie: .space 4
matrice: .space 1600
copie_matrice: .space 1600
i: .space 4
j: .space 4
nr: .space 4
formatcitire: .asciz "%d"
formatafisare: .asciz "%d "
linienoua: .asciz "\n"
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




#########################################################################
Afisare_matrice:
movl $1, linie
et_for2_linie:
movl linie, %ecx
incl %ecx
cmpl m, %ecx
je et_iesire_for2_linie
  movl $1, coloana
  et_for2_coloana:
  movl coloana, %ecx
  incl %ecx
  cmpl n, %ecx
  je et_iesire_for2_coloana
  lea matrice, %edi
  movl n, %eax
  movl $0, %edx
  mull linie
  addl coloana, %eax
  movl (%edi, %eax, 4), %ebx

  pushl %ebx
  pushl $formatafisare
  call  printf
  addl $8, %esp

  push $0
  call fflush
  addl $4, %esp

  incl coloana
  jmp et_for2_coloana
et_iesire_for2_coloana:
movl $4, %eax
movl $1, %ebx
movl $linienoua, %ecx
movl $2, %edx
int $0x80

incl linie
jmp et_for2_linie
et_iesire_for2_linie:



##############################################################################
Exit:
pushl $0
call fflush
addl $4, %esp

movl $1, %eax
xor %ebx, %ebx
int $0x80
