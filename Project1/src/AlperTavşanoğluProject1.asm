.data
newline: .asciiz "\n"
prnt1: .asciiz "Enter number of rows: "
prnt2: .asciiz "Enter number of columns: "
prnt3: .asciiz "Enter second: "
prnt4: .asciiz "Entered grid after "
prnt5: .asciiz " seconds later "
.text
Main:
	# Print for second
	li $v0, 4				# syscall: print_str
	la $a0, prnt3			# load address of prnt2
	syscall				#system call for printing string

        # Read second
        li $v0, 5				# syscall: read_int
        syscall				#system call for reading integer
        move $s0,$v0			# s0 = sec
        
	# Print for row
	li $v0, 4				# syscall: print_str
	la $a0, prnt1			# load address of prnt2
	syscall				#system call for printing string

        # Read row
        li $v0, 5				# syscall: read_int
        syscall				#system call for reading integer
        move $t1,$v0			# t1 = row

	# Print for columns
	li $v0, 4				# syscall: print_str
	la $a0, prnt2			# load address of prnt2
	syscall				#system call for printing string

        # Read columns
        li $v0, 5				# syscall: read_int
        syscall				#system call for reading integer
        move $t2,$v0			# t2 = column

	mul $a0, $t1, $t2		# row * columns
	li  $v0, 9				# allocate heap memory for 2D array
	syscall				#system call for sbrk (allocate heap memory)
	move $t0,$v0			# save array base address in $t0

###########################################	Reading user input for fill 2D array
	li $t3, 0									#  i = 0 ( initialize outer loop counter)
outer_loop_read:
	bge $t3, $t1, end_outer_loop_read				# if i = row jump end of the outer loop
	li $t4, 0									# j = 0 (initialize inner loop counter)

inner_loop_read:
	bge $t4, $t2, end_inner_loop_read				# if j = columns  jump end of the inner loop
	# Calculate the index in the matrix
	mul $t5, $t3, $t2								# $t5 = width * i
	add $t5, $t5, $t4								# $t5 = width * i + j
	sll $t5, $t5, 2								# $t5 = 2^2 * (width * i + j)
	add $t5, $t0, $t5								# $t5 = base address + (2^2 * (width * i + j))

	li $v0, 12									# read character for fill 2D array
	syscall									#system call for reading character

	sb $v0, 0($t5)								# store input character into array
	addiu $t4, $t4, 1								# increment inner loop counter
	b inner_loop_read							# branch unconditionally back to the beginning of the inner loop

end_inner_loop_read:

	addiu $t3, $t3, 1								#  increment outer loop counter
	li $v0, 4									#  prompt for a newline
	la $a0, newline								#  load address of newline
	syscall									# system call for printing string
	b outer_loop_read							# branch unconditionally back to the beginning of the outer loop
	
end_outer_loop_read:
###########################################	for cheking second conditions
	li $t3,1									# load t3 = 1 for checking second
	beq $s0,$t3,print_finale_array					# if second = 1 print starting grid which user entered with subroutine

	li $t3,2									# load t3 = 2 for checking second
	div $s0,$t3									# divide for checking second mod 2
	mfhi $t3									# store remainder
	beq $t3,$zero,enter_bomb_all_grid				# if second % 2 == 0  enter bomb for all grid subroutine

	li $s3,4									# load t3 = 4 for checking second
	move $s2,$s0								# load t2 =  second
	addi $s2,$s2,1								# t2 = second + 1 for checkin second cond
	div $s2,$s3								# divide for checking second mod 4
	mfhi $s2									# store remainder
	beq $s2,$zero,t_eq_one						# if not (second+1)%4==0 jump for make s2 = 1
	li $s2,2									# if  (second+1)%4==0  s2=2
	j bomberman								# jump bomberman subroutine
t_eq_one:
	li $s2,1									# if not (second+1)%4==0  make s2 = 1

###################################################################################################################### bomberman game subroutine for odd seconds

bomberman:
	li $s3,0									#  t = 0 ( initialize outermost loop counter for checking second condition)
bomberman_loop:
	li $t3, 0									#  i = 0 ( initialize outer loop counter)
dýs_loop:
	bge $t3, $t1, dýs_loop_bitti						# if i = row jump end of the outer loop
	li $t4, 0									# j = 0 (initialize inner loop counter)
ic_loop:
	bge $t4, $t2, ic_loop_bitti						# if j = columns  jump end of the inner loop
	# Calculate the index in the matrix
	mul $t5, $t3, $t2								# $t5 = width * i
	add $t5, $t5, $t4								# $t5 = width * i + j
	sll $t5, $t5, 2								# $t5 = 2^2 * (width * i + j)
	add $t5, $t0, $t5								# $t5 = base address + (2^2 * (width * i + j))
    
	li $t6,79									# t6 = O
	li $t7,46									# t7 = .
	lb $s1, 0($t5)								# s1 = initial grid
	beq $t6, $s1, Bomb							# if initial grid has bomb explode around
	 j Resume									# if initial grid has no bomb jump
Bomb:
	addiu $s4, $t4, 1							# j + 1 for reach right side
	slt  $s5, $s4,$t2								# check  j + 1 < col
	beq $s5, $zero, Resume2						# if not  j + 1 < col  jump condition 2
	# Calculate the index in the matrix
	mul $t8, $t3, $t2								# $t8 = width * i
	add $t8, $t8, $s4							# $t8 = width * i + j
	sll $t8, $t8, 2								# $t8 = 2^2 * (width * i + j)
	add $t8, $t0, $t8								# $t8 = base address + (2^2 * (width * i + j))
	lb $t9, 0($t8)								# store grid[i][j+1] 
	bne $t9, $t7, Resume2						# if grid[i][j+1] !=46 ( which . )  jump condition 2
	li $s6,47									# make grid[i][j+1] = temporary symbol  "/"
	sb $s6, 0($t8)								# Store the character in memory

Resume2:
	slt $s5, $zero,$t4							# check  j > 0
	beq $s5,$zero,Resume3						# if not  j  > 0  jump condition 3
	addiu $s4, $t4, -1							# j - 1 for reach left side
	# Calculate the index in the matrix
	mul $t8, $t3, $t2								# $t8 = width * i
	add $t8, $t8, $s4							# $t8 = width * i + j
	sll $t8, $t8, 2								# $t8 = 2^2 * (width * i + j)
	add $t8, $t0, $t8								# $t8 = base address + (2^2 * (width * i + j))
	lb $t9, 0($t8)								# store grid[i][j-1] 
	bne $t9, $t7, Resume3						# if grid[i][j-1] !=46 ( which . ) jump condition 3
	li $s6,47									# make grid[i][j-1] = temporary symbol  "/"
	sb $s6, 0($t8)								# Store the character in memory

Resume3:
	addiu $s4, $t3, 1							# i + 1 for reach down side
	slt  $s5, $s4,$t1								# check  i + 1 < row
	beq $s5, $zero, Resume4						# if not  i + 1 < row  jump condition 4
	# Calculate the index in the matrix
	mul $t8, $s4, $t2								# $t8 = height * i
	add $t8, $t8, $t4								# $t8 = height * i + j
	sll $t8, $t8, 2								# $t8 = 2^2 * (height * i + j)
	add $t8, $t0, $t8								# $t8 = base address + (2^2 * (height * i + j))
	lb $t9, 0($t8)								# store grid[i+1][j] 
	bne $t9, $t7, Resume4						# if grid[i+1][j]  !=46 ( which . ) jump condition 4
	li $s6,47									# make grid[i+1][j] = temporary symbol  "/"
	sb $s6, 0($t8)								# Store the character in memory

Resume4:
	slt $s5, $zero,$t3							# check  i > 0
	beq $s5,$zero,Resume						# if not  i  > 0  jump end of conditions
	addiu $s4, $t3, -1							# i - 1 for reach upper side
	# Calculate the index in the matrix
	mul $t8, $s4, $t2								# $t8 = height * i
	add $t8, $t8, $t4								# $t8 = height * i + j
	sll $t8, $t8, 2								# $t8 = 2^2 * (height * i + j)
	add $t8, $t0, $t8								# $t8 = base address + (2^2 * (height * i + j))
	lb $t9, 0($t8)								# store grid[i-1][j] 
	bne $t9, $t7, Resume							# if grid[i-1][j]  !=46 ( which . ) jump condition 4
	li $s6,47									# make grid[i-1][j] = temporary symbol  "/"
	sb $s6, 0($t8)								# Store the character in memory

Resume:
	addiu $t4, $t4, 1								# increment inner loop counter
	b ic_loop									# branch unconditionally back to the beginning of the inner loop

ic_loop_bitti:
	addiu $t3, $t3, 1								#  increment outer loop counter
	b dýs_loop									# branch unconditionally back to the beginning of the outer loop

dýs_loop_bitti:
###########################################	changing subroutine for make bomb where is ( . )
	li $t6,79									#t6 =O
	li $t7,46									#t7=.
	li $t3, 0									#  i = 0 ( initialize outer loop counter)
dýs_loop_degisim:
	bge $t3, $t1,dýs_loop_degisim_bitti				# if i = row jump end of the outer loop
	li $t4, 0									# j = 0 (initialize inner loop counter)

ic_loop_degisim:
	bge $t4, $t2, ic_loop_degisim_bitti				# if j = columns  jump end of the inner loop
	# Calculate the index in the matrix
	mul $t5, $t3, $t2								# $t5 = width * i
	add $t5, $t5, $t4								# $t5 = width * i + j
	sll $t5, $t5, 2								# $t5 = 2^2 * (width * i + j)
	add $t5, $t0, $t5								# $t5 = base address + (2^2 * (width * i + j))
	lb $t8, 0($t5)								# t8 = initial grid
	bne $t8, $t7, change							# if initial grid !=46 ( which . )  jump condition change
	sb $t6, 0($t5)								# if initial grid ==46 ( which . )  make it 79 ( which O )
	j skip										# jump skip
change:
	sb $t7, 0($t5)								#  if initial grid !=46 ( which . ) make it  46 ( which . )
skip:
	addiu $t4, $t4, 1								#  increment inner loop counter
	b ic_loop_degisim							# branch unconditionally back to the beginning of the inner loop

ic_loop_degisim_bitti:
	addiu $t3, $t3, 1								#  increment outer loop counter
	b dýs_loop_degisim							# branch unconditionally back to the beginning of the outer loop

dýs_loop_degisim_bitti:

	addi $s3, $s3, 1								#  increment outmost loop counter t++ ( outermost loop counter for checking second condition)
	bge $s3, $s2, print_finale_array					# if t = s2 jump for printing array
	j bomberman_loop							# jump again bomberman loop
################################################################################################################## printing finale array subroutine 

print_finale_array:

	li $v0, 4									# syscall: print_str
	la $a0, prnt4								# load address of prnt4
	syscall									#system call for printing string
	
	li $v0, 1									# syscall: print_integer
	move $a0,$s0								# load a0 =  second
	syscall									#system call for printing string
	
	li $v0, 4									# syscall: print_str
	la $a0, prnt5								# load address of prnt5
	syscall									#system call for printing string
	
	li $v0, 4									#  prompt for a newline
	la $a0, newline								#  load address of newline
	syscall									# system call for printing string

	li $t3, 0									#  i = 0 ( initialize outer loop counter)
outer_loop_for_print:
	bge $t3, $t1, end_outer_loop_for_print				# if i = row jump end of the outer loop
	li $t4, 0									# j = 0 (initialize inner loop counter)

inner_loop_for_print:
	bge $t4, $t2, end_inner_loop_for_print				# if j = columns  jump end of the inner loop
	# Calculate the index in the matrix
	mul $t5, $t3, $t2								# $t5 = width * i
	add $t5, $t5, $t4								# $t5 = width * i + j
	sll $t5, $t5, 2								# $t5 = 2^2 * (width * i + j)
	add $t5, $t0, $t5								# $t5 = base address + (2^2 * (width * i + j))
	lb $a0, 0($t5)								# a0 = initial grid
	# Print the character
	li $v0, 11									# syscall: print character
	syscall									# system call for printing string
	addiu $t4, $t4, 1								#  increment inner loop counter
	b inner_loop_for_print							# branch unconditionally back to the beginning of the inner loop

end_inner_loop_for_print:
	# Print a newline after each row
	li $v0, 11									# syscall: print character
	li $a0, 10									# ASCII code for newline
	syscall									# system call for printing string
	addiu $t3, $t3, 1      							#  increment outer loop counter
	b outer_loop_for_print						# branch unconditionally back to the beginning of the outer loop

end_outer_loop_for_print:

	li $v0, 10									# exit (terminate execution)	
	syscall									# system call for exit

#####################################################################	enter bomb all grid subroutine for even seconds

enter_bomb_all_grid:
	li $t6,79									#t6 =O
	li $t3, 0									#  i = 0 ( initialize outer loop counter)

outer_for_bomb:
	bge $t3, $t1,outer_for_bomb_end				# if i = row jump end of the outer loop
	li $t4, 0									# j = 0 (initialize inner loop counter)

inner_for_bomb:
	bge $t4, $t2, inner_for_bomb_end				# if j = columns  jump end of the inner loop
	# Calculate the index in the matrix
	mul $t5, $t3, $t2								# $t5 = width * i
	add $t5, $t5, $t4								# $t5 = width * i + j
	sll $t5, $t5, 2								# $t5 = 2^2 * (width * i + j)
	add $t5, $t0, $t5								# $t5 = base address + (2^2 * (width * i + j))
	sb $t6, 0($t5)								# if initial grid =79  ( which O )
	addiu $t4, $t4, 1								#  increment inner loop counter
	b inner_for_bomb							# branch unconditionally back to the beginning of the inner loop

inner_for_bomb_end:
	addiu $t3, $t3, 1								#  increment outer loop counter
	b outer_for_bomb							# branch unconditionally back to the beginning of the outer loop

outer_for_bomb_end:
	j print_finale_array							# jump for printing full bomb grid
