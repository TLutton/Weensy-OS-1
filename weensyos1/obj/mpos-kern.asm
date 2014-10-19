
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 08 02 00 00       	call   100221 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 88 9f 10 00       	mov    0x109f88,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 54             	imul   $0x54,%edx,%eax
  1000a4:	83 b8 2c 92 10 00 01 	cmpl   $0x1,0x10922c(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 e0 91 10 00       	add    $0x1091e0,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 89 03 00 00       	call   100444 <run>

001000bb <interrupt>:

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d 88 9f 10 00    	mov    0x109f88,%ebx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 08             	lea    0x8(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 04             	cmp    $0x4,%eax
  1000e1:	0f 87 38 01 00 00    	ja     10021f <interrupt+0x164>
  1000e7:	ff 24 85 fc 09 10 00 	jmp    *0x1009fc(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
		run(current);
  1000f0:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000f3:	89 43 24             	mov    %eax,0x24(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	e9 92 00 00 00       	jmp    10018e <interrupt+0xd3>
  1000fc:	b8 80 92 10 00       	mov    $0x109280,%eax
  100101:	ba 01 00 00 00       	mov    $0x1,%edx
	int i;
	process_t *avail_proc_desc;

	// Find an empty process descriptor
	for(i = 1; i != NPROCS; ++i) {
		if(proc_array[i].p_state == P_EMPTY) {
  100106:	83 38 00             	cmpl   $0x0,(%eax)
  100109:	75 07                	jne    100112 <interrupt+0x57>
			avail_proc_desc = &(proc_array[i]);
			break;
		}
	}
	if(i == NPROCS)
  10010b:	83 fa 10             	cmp    $0x10,%edx
  10010e:	75 0d                	jne    10011d <interrupt+0x62>
  100110:	eb 6d                	jmp    10017f <interrupt+0xc4>
{
	int i;
	process_t *avail_proc_desc;

	// Find an empty process descriptor
	for(i = 1; i != NPROCS; ++i) {
  100112:	42                   	inc    %edx
  100113:	83 c0 54             	add    $0x54,%eax
  100116:	83 fa 10             	cmp    $0x10,%edx
  100119:	75 eb                	jne    100106 <interrupt+0x4b>
  10011b:	eb 62                	jmp    10017f <interrupt+0xc4>
		if(proc_array[i].p_state == P_EMPTY) {
			avail_proc_desc = &(proc_array[i]);
  10011d:	6b d2 54             	imul   $0x54,%edx,%edx
	}
	if(i == NPROCS)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
  100120:	b9 11 00 00 00       	mov    $0x11,%ecx
  100125:	8d 73 08             	lea    0x8(%ebx),%esi
	process_t *avail_proc_desc;

	// Find an empty process descriptor
	for(i = 1; i != NPROCS; ++i) {
		if(proc_array[i].p_state == P_EMPTY) {
			avail_proc_desc = &(proc_array[i]);
  100128:	8d aa e0 91 10 00    	lea    0x1091e0(%edx),%ebp

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
  10012e:	8b 82 e0 91 10 00    	mov    0x1091e0(%edx),%eax
	}
	if(i == NPROCS)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
  100134:	8d 7d 08             	lea    0x8(%ebp),%edi
  100137:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
  100139:	8b 0b                	mov    (%ebx),%ecx
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
  10013b:	83 c0 0a             	add    $0xa,%eax
	dest_stack_bottom = dest_stack_top - (src_stack_top - src_stack_bottom);
  10013e:	8b 73 44             	mov    0x44(%ebx),%esi

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
  100141:	c1 e0 12             	shl    $0x12,%eax
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
  100144:	83 c1 0a             	add    $0xa,%ecx
  100147:	c1 e1 12             	shl    $0x12,%ecx
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top - (src_stack_top - src_stack_bottom);
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	
	memcpy((void*)dest_stack_top, (void*)src_stack_top, (dest_stack_top - dest_stack_bottom));
  10014a:	57                   	push   %edi
  10014b:	89 c7                	mov    %eax,%edi
	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top - (src_stack_top - src_stack_bottom);
  10014d:	01 c6                	add    %eax,%esi
  10014f:	29 ce                	sub    %ecx,%esi
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	
	memcpy((void*)dest_stack_top, (void*)src_stack_top, (dest_stack_top - dest_stack_bottom));
  100151:	29 f7                	sub    %esi,%edi
  100153:	57                   	push   %edi
  100154:	51                   	push   %ecx
  100155:	50                   	push   %eax
  100156:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  10015a:	e8 bd 03 00 00       	call   10051c <memcpy>
	avail_proc_desc->p_registers = parent->p_registers;
	copy_stack(avail_proc_desc, parent);
	avail_proc_desc->p_state = P_RUNNABLE;
	
	avail_proc_desc->p_registers.reg_eax = 0;
	return avail_proc_desc->p_pid;
  10015f:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  100163:	83 c4 10             	add    $0x10,%esp
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top - (src_stack_top - src_stack_bottom);
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	
	memcpy((void*)dest_stack_top, (void*)src_stack_top, (dest_stack_top - dest_stack_bottom));
	dest->p_registers.reg_esp = dest_stack_bottom;
  100166:	89 75 44             	mov    %esi,0x44(%ebp)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
	copy_stack(avail_proc_desc, parent);
	avail_proc_desc->p_state = P_RUNNABLE;
  100169:	c7 45 4c 01 00 00 00 	movl   $0x1,0x4c(%ebp)
	
	avail_proc_desc->p_registers.reg_eax = 0;
  100170:	c7 45 24 00 00 00 00 	movl   $0x0,0x24(%ebp)
	return avail_proc_desc->p_pid;
  100177:	8b 82 e0 91 10 00    	mov    0x1091e0(%edx),%eax
  10017d:	eb 03                	jmp    100182 <interrupt+0xc7>
  10017f:	83 c8 ff             	or     $0xffffffff,%eax
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  100182:	89 43 24             	mov    %eax,0x24(%ebx)
		run(current);
  100185:	83 ec 0c             	sub    $0xc,%esp
  100188:	ff 35 88 9f 10 00    	pushl  0x109f88
  10018e:	e8 b1 02 00 00       	call   100444 <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  100193:	e8 f4 fe ff ff       	call   10008c <schedule>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  100198:	a1 88 9f 10 00       	mov    0x109f88,%eax
		current->p_exit_status = current->p_registers.reg_eax;
		if(current->p_waiting_pid != -1)
  10019d:	8b 50 04             	mov    0x4(%eax),%edx
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
  1001a0:	8b 48 24             	mov    0x24(%eax),%ecx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  1001a3:	c7 40 4c 03 00 00 00 	movl   $0x3,0x4c(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
		if(current->p_waiting_pid != -1)
  1001aa:	83 fa ff             	cmp    $0xffffffff,%edx
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
  1001ad:	89 48 50             	mov    %ecx,0x50(%eax)
		if(current->p_waiting_pid != -1)
  1001b0:	74 1a                	je     1001cc <interrupt+0x111>
		{
		proc_array[current->p_waiting_pid].p_state = P_RUNNABLE; // parent process is now unblocked
  1001b2:	6b d2 54             	imul   $0x54,%edx,%edx
		proc_array[current->p_waiting_pid].p_registers.reg_eax = current->p_exit_status;
		current->p_waiting_pid = -1;  // no waiting process
  1001b5:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
		if(current->p_waiting_pid != -1)
		{
		proc_array[current->p_waiting_pid].p_state = P_RUNNABLE; // parent process is now unblocked
  1001bc:	c7 82 2c 92 10 00 01 	movl   $0x1,0x10922c(%edx)
  1001c3:	00 00 00 
		proc_array[current->p_waiting_pid].p_registers.reg_eax = current->p_exit_status;
  1001c6:	89 8a 04 92 10 00    	mov    %ecx,0x109204(%edx)
		current->p_waiting_pid = -1;  // no waiting process
		}
		schedule();
  1001cc:	e8 bb fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001d1:	a1 88 9f 10 00       	mov    0x109f88,%eax
  1001d6:	8b 50 24             	mov    0x24(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001d9:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001dc:	83 f9 0e             	cmp    $0xe,%ecx
  1001df:	77 11                	ja     1001f2 <interrupt+0x137>
  1001e1:	3b 10                	cmp    (%eax),%edx
  1001e3:	74 0d                	je     1001f2 <interrupt+0x137>
		    || proc_array[p].p_state == P_EMPTY)
  1001e5:	6b d2 54             	imul   $0x54,%edx,%edx
  1001e8:	8b 8a 2c 92 10 00    	mov    0x10922c(%edx),%ecx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001ee:	85 c9                	test   %ecx,%ecx
  1001f0:	75 09                	jne    1001fb <interrupt+0x140>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001f2:	c7 40 24 ff ff ff ff 	movl   $0xffffffff,0x24(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001f9:	eb 1f                	jmp    10021a <interrupt+0x15f>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  1001fb:	83 f9 03             	cmp    $0x3,%ecx
  1001fe:	75 0b                	jne    10020b <interrupt+0x150>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  100200:	8b 92 30 92 10 00    	mov    0x109230(%edx),%edx
  100206:	89 50 24             	mov    %edx,0x24(%eax)
  100209:	eb 0f                	jmp    10021a <interrupt+0x15f>
		   add calling process (current) to "wait queue" 
		   
		   change current->p_status to blocked.
		   
		   */
		   current->p_state = P_BLOCKED;
  10020b:	c7 40 4c 02 00 00 00 	movl   $0x2,0x4c(%eax)
		   proc_array[p].p_waiting_pid = current->p_pid;
  100212:	8b 00                	mov    (%eax),%eax
  100214:	89 82 e4 91 10 00    	mov    %eax,0x1091e4(%edx)
		   
		//	current->p_registers.reg_eax = WAIT_TRYAGAIN;
		}
		schedule();
  10021a:	e8 6d fe ff ff       	call   10008c <schedule>
  10021f:	eb fe                	jmp    10021f <interrupt+0x164>

00100221 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  100221:	53                   	push   %ebx
  100222:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  100225:	68 40 05 00 00       	push   $0x540
  10022a:	6a 00                	push   $0x0
  10022c:	68 e0 91 10 00       	push   $0x1091e0
  100231:	e8 4a 03 00 00       	call   100580 <memset>
  100236:	b8 e0 91 10 00       	mov    $0x1091e0,%eax
  10023b:	31 d2                	xor    %edx,%edx
  10023d:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100240:	89 10                	mov    %edx,(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100242:	42                   	inc    %edx
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  100243:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
		proc_array[i].p_waiting_pid = -1; // Nothing waiting
  10024a:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100251:	83 c0 54             	add    $0x54,%eax
  100254:	83 fa 10             	cmp    $0x10,%edx
  100257:	75 e7                	jne    100240 <start+0x1f>
		proc_array[i].p_state = P_EMPTY;
		proc_array[i].p_waiting_pid = -1; // Nothing waiting
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  100259:	c7 05 88 9f 10 00 34 	movl   $0x109234,0x109f88
  100260:	92 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100263:	e8 74 00 00 00       	call   1002dc <segments_init>
	special_registers_init(current);
  100268:	83 ec 0c             	sub    $0xc,%esp
  10026b:	ff 35 88 9f 10 00    	pushl  0x109f88
  100271:	e8 e5 01 00 00       	call   10045b <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  100276:	e8 30 01 00 00       	call   1003ab <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  10027b:	83 c4 0c             	add    $0xc,%esp
  10027e:	68 10 0a 10 00       	push   $0x100a10
  100283:	68 00 07 00 00       	push   $0x700
  100288:	ff 35 00 00 06 00    	pushl  0x60000
  10028e:	e8 4f 07 00 00       	call   1009e2 <console_printf>
  100293:	83 c4 10             	add    $0x10,%esp
  100296:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  10029b:	e8 4e 01 00 00       	call   1003ee <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  1002a0:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1002a3:	83 fb 01             	cmp    $0x1,%ebx
  1002a6:	77 f3                	ja     10029b <start+0x7a>
	console_clear();
  1002a8:	e8 fe 00 00 00       	call   1003ab <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  1002ad:	50                   	push   %eax
  1002ae:	50                   	push   %eax
  1002af:	a1 88 9f 10 00       	mov    0x109f88,%eax
  1002b4:	83 c0 38             	add    $0x38,%eax
  1002b7:	50                   	push   %eax
  1002b8:	53                   	push   %ebx
  1002b9:	e8 d2 01 00 00       	call   100490 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  1002be:	a1 88 9f 10 00       	mov    0x109f88,%eax
  1002c3:	c7 40 44 00 00 2c 00 	movl   $0x2c0000,0x44(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  1002ca:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)

	// Switch to the main process using run().
	run(current);
  1002d1:	89 04 24             	mov    %eax,(%esp)
  1002d4:	e8 6b 01 00 00       	call   100444 <run>
  1002d9:	90                   	nop
  1002da:	90                   	nop
  1002db:	90                   	nop

001002dc <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002dc:	b8 20 97 10 00       	mov    $0x109720,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002e1:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002e6:	89 c2                	mov    %eax,%edx
  1002e8:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  1002eb:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002ec:	bb 56 00 10 00       	mov    $0x100056,%ebx
  1002f1:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002f4:	66 a3 ae 1a 10 00    	mov    %ax,0x101aae
  1002fa:	c1 e8 18             	shr    $0x18,%eax
  1002fd:	88 15 b0 1a 10 00    	mov    %dl,0x101ab0
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100303:	ba 88 97 10 00       	mov    $0x109788,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100308:	a2 b3 1a 10 00       	mov    %al,0x101ab3
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10030d:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10030f:	66 c7 05 ac 1a 10 00 	movw   $0x68,0x101aac
  100316:	68 00 
  100318:	c6 05 b2 1a 10 00 40 	movb   $0x40,0x101ab2
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  10031f:	c6 05 b1 1a 10 00 89 	movb   $0x89,0x101ab1

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  100326:	c7 05 24 97 10 00 00 	movl   $0x80000,0x109724
  10032d:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  100330:	66 c7 05 28 97 10 00 	movw   $0x10,0x109728
  100337:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100339:	66 89 0c c5 88 97 10 	mov    %cx,0x109788(,%eax,8)
  100340:	00 
  100341:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100348:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10034d:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  100352:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  100357:	40                   	inc    %eax
  100358:	3d 00 01 00 00       	cmp    $0x100,%eax
  10035d:	75 da                	jne    100339 <segments_init+0x5d>
  10035f:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  100363:	ba 88 97 10 00       	mov    $0x109788,%edx
  100368:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  10036f:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100376:	66 89 0c c5 88 97 10 	mov    %cx,0x109788(,%eax,8)
  10037d:	00 
  10037e:	c1 e9 10             	shr    $0x10,%ecx
  100381:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100386:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  10038b:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100390:	40                   	inc    %eax
  100391:	83 f8 3a             	cmp    $0x3a,%eax
  100394:	75 d2                	jne    100368 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  100396:	b0 28                	mov    $0x28,%al
  100398:	0f 01 15 74 1a 10 00 	lgdtl  0x101a74
  10039f:	0f 00 d8             	ltr    %ax
  1003a2:	0f 01 1d 7c 1a 10 00 	lidtl  0x101a7c
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  1003a9:	5b                   	pop    %ebx
  1003aa:	c3                   	ret    

001003ab <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003ab:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003ac:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003ae:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003af:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  1003b6:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  1003b9:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  1003c0:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  1003c3:	40                   	inc    %eax
  1003c4:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  1003c9:	75 ee                	jne    1003b9 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1003cb:	be d4 03 00 00       	mov    $0x3d4,%esi
  1003d0:	b0 0e                	mov    $0xe,%al
  1003d2:	89 f2                	mov    %esi,%edx
  1003d4:	ee                   	out    %al,(%dx)
  1003d5:	31 c9                	xor    %ecx,%ecx
  1003d7:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1003dc:	88 c8                	mov    %cl,%al
  1003de:	89 da                	mov    %ebx,%edx
  1003e0:	ee                   	out    %al,(%dx)
  1003e1:	b0 0f                	mov    $0xf,%al
  1003e3:	89 f2                	mov    %esi,%edx
  1003e5:	ee                   	out    %al,(%dx)
  1003e6:	88 c8                	mov    %cl,%al
  1003e8:	89 da                	mov    %ebx,%edx
  1003ea:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  1003eb:	5b                   	pop    %ebx
  1003ec:	5e                   	pop    %esi
  1003ed:	c3                   	ret    

001003ee <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1003ee:	ba 64 00 00 00       	mov    $0x64,%edx
  1003f3:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  1003f4:	a8 01                	test   $0x1,%al
  1003f6:	74 45                	je     10043d <console_read_digit+0x4f>
  1003f8:	b2 60                	mov    $0x60,%dl
  1003fa:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  1003fb:	8d 50 fe             	lea    -0x2(%eax),%edx
  1003fe:	80 fa 08             	cmp    $0x8,%dl
  100401:	77 05                	ja     100408 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  100403:	0f b6 c0             	movzbl %al,%eax
  100406:	48                   	dec    %eax
  100407:	c3                   	ret    
	else if (data == 0x0B)
  100408:	3c 0b                	cmp    $0xb,%al
  10040a:	74 35                	je     100441 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  10040c:	8d 50 b9             	lea    -0x47(%eax),%edx
  10040f:	80 fa 02             	cmp    $0x2,%dl
  100412:	77 07                	ja     10041b <console_read_digit+0x2d>
		return data - 0x47 + 7;
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	83 e8 40             	sub    $0x40,%eax
  10041a:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  10041b:	8d 50 b5             	lea    -0x4b(%eax),%edx
  10041e:	80 fa 02             	cmp    $0x2,%dl
  100421:	77 07                	ja     10042a <console_read_digit+0x3c>
		return data - 0x4B + 4;
  100423:	0f b6 c0             	movzbl %al,%eax
  100426:	83 e8 47             	sub    $0x47,%eax
  100429:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  10042a:	8d 50 b1             	lea    -0x4f(%eax),%edx
  10042d:	80 fa 02             	cmp    $0x2,%dl
  100430:	77 07                	ja     100439 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  100432:	0f b6 c0             	movzbl %al,%eax
  100435:	83 e8 4e             	sub    $0x4e,%eax
  100438:	c3                   	ret    
	else if (data == 0x53)
  100439:	3c 53                	cmp    $0x53,%al
  10043b:	74 04                	je     100441 <console_read_digit+0x53>
  10043d:	83 c8 ff             	or     $0xffffffff,%eax
  100440:	c3                   	ret    
  100441:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  100443:	c3                   	ret    

00100444 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  100444:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100448:	a3 88 9f 10 00       	mov    %eax,0x109f88

	asm volatile("movl %0,%%esp\n\t"
  10044d:	83 c0 08             	add    $0x8,%eax
  100450:	89 c4                	mov    %eax,%esp
  100452:	61                   	popa   
  100453:	07                   	pop    %es
  100454:	1f                   	pop    %ds
  100455:	83 c4 08             	add    $0x8,%esp
  100458:	cf                   	iret   
  100459:	eb fe                	jmp    100459 <run+0x15>

0010045b <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  10045b:	53                   	push   %ebx
  10045c:	83 ec 0c             	sub    $0xc,%esp
  10045f:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  100463:	6a 44                	push   $0x44
  100465:	6a 00                	push   $0x0
  100467:	8d 43 08             	lea    0x8(%ebx),%eax
  10046a:	50                   	push   %eax
  10046b:	e8 10 01 00 00       	call   100580 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100470:	66 c7 43 3c 1b 00    	movw   $0x1b,0x3c(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  100476:	66 c7 43 2c 23 00    	movw   $0x23,0x2c(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  10047c:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  100482:	66 c7 43 48 23 00    	movw   $0x23,0x48(%ebx)
}
  100488:	83 c4 18             	add    $0x18,%esp
  10048b:	5b                   	pop    %ebx
  10048c:	c3                   	ret    
  10048d:	90                   	nop
  10048e:	90                   	nop
  10048f:	90                   	nop

00100490 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100490:	55                   	push   %ebp
  100491:	57                   	push   %edi
  100492:	56                   	push   %esi
  100493:	53                   	push   %ebx
  100494:	83 ec 1c             	sub    $0x1c,%esp
  100497:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  10049b:	83 f8 01             	cmp    $0x1,%eax
  10049e:	7f 04                	jg     1004a4 <program_loader+0x14>
  1004a0:	85 c0                	test   %eax,%eax
  1004a2:	79 02                	jns    1004a6 <program_loader+0x16>
  1004a4:	eb fe                	jmp    1004a4 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  1004a6:	8b 34 c5 b4 1a 10 00 	mov    0x101ab4(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  1004ad:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  1004b3:	74 02                	je     1004b7 <program_loader+0x27>
  1004b5:	eb fe                	jmp    1004b5 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004b7:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  1004ba:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004be:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  1004c0:	c1 e5 05             	shl    $0x5,%ebp
  1004c3:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  1004c6:	eb 3f                	jmp    100507 <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  1004c8:	83 3b 01             	cmpl   $0x1,(%ebx)
  1004cb:	75 37                	jne    100504 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  1004cd:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1004d0:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  1004d3:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1004d6:	01 c7                	add    %eax,%edi
	memsz += va;
  1004d8:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  1004da:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  1004df:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  1004e3:	52                   	push   %edx
  1004e4:	89 fa                	mov    %edi,%edx
  1004e6:	29 c2                	sub    %eax,%edx
  1004e8:	52                   	push   %edx
  1004e9:	8b 53 04             	mov    0x4(%ebx),%edx
  1004ec:	01 f2                	add    %esi,%edx
  1004ee:	52                   	push   %edx
  1004ef:	50                   	push   %eax
  1004f0:	e8 27 00 00 00       	call   10051c <memcpy>
  1004f5:	83 c4 10             	add    $0x10,%esp
  1004f8:	eb 04                	jmp    1004fe <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  1004fa:	c6 07 00             	movb   $0x0,(%edi)
  1004fd:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1004fe:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  100502:	72 f6                	jb     1004fa <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  100504:	83 c3 20             	add    $0x20,%ebx
  100507:	39 eb                	cmp    %ebp,%ebx
  100509:	72 bd                	jb     1004c8 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  10050b:	8b 56 18             	mov    0x18(%esi),%edx
  10050e:	8b 44 24 34          	mov    0x34(%esp),%eax
  100512:	89 10                	mov    %edx,(%eax)
}
  100514:	83 c4 1c             	add    $0x1c,%esp
  100517:	5b                   	pop    %ebx
  100518:	5e                   	pop    %esi
  100519:	5f                   	pop    %edi
  10051a:	5d                   	pop    %ebp
  10051b:	c3                   	ret    

0010051c <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  10051c:	56                   	push   %esi
  10051d:	31 d2                	xor    %edx,%edx
  10051f:	53                   	push   %ebx
  100520:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100524:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100528:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  10052c:	eb 08                	jmp    100536 <memcpy+0x1a>
		*d++ = *s++;
  10052e:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  100531:	4e                   	dec    %esi
  100532:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100535:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100536:	85 f6                	test   %esi,%esi
  100538:	75 f4                	jne    10052e <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  10053a:	5b                   	pop    %ebx
  10053b:	5e                   	pop    %esi
  10053c:	c3                   	ret    

0010053d <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  10053d:	57                   	push   %edi
  10053e:	56                   	push   %esi
  10053f:	53                   	push   %ebx
  100540:	8b 44 24 10          	mov    0x10(%esp),%eax
  100544:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100548:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  10054c:	39 c7                	cmp    %eax,%edi
  10054e:	73 26                	jae    100576 <memmove+0x39>
  100550:	8d 34 17             	lea    (%edi,%edx,1),%esi
  100553:	39 c6                	cmp    %eax,%esi
  100555:	76 1f                	jbe    100576 <memmove+0x39>
		s += n, d += n;
  100557:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  10055a:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  10055c:	eb 07                	jmp    100565 <memmove+0x28>
			*--d = *--s;
  10055e:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100561:	4a                   	dec    %edx
  100562:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100565:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  100566:	85 d2                	test   %edx,%edx
  100568:	75 f4                	jne    10055e <memmove+0x21>
  10056a:	eb 10                	jmp    10057c <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  10056c:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  10056f:	4a                   	dec    %edx
  100570:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  100573:	41                   	inc    %ecx
  100574:	eb 02                	jmp    100578 <memmove+0x3b>
  100576:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  100578:	85 d2                	test   %edx,%edx
  10057a:	75 f0                	jne    10056c <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  10057c:	5b                   	pop    %ebx
  10057d:	5e                   	pop    %esi
  10057e:	5f                   	pop    %edi
  10057f:	c3                   	ret    

00100580 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100580:	53                   	push   %ebx
  100581:	8b 44 24 08          	mov    0x8(%esp),%eax
  100585:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100589:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  10058d:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  10058f:	eb 04                	jmp    100595 <memset+0x15>
		*p++ = c;
  100591:	88 1a                	mov    %bl,(%edx)
  100593:	49                   	dec    %ecx
  100594:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100595:	85 c9                	test   %ecx,%ecx
  100597:	75 f8                	jne    100591 <memset+0x11>
		*p++ = c;
	return v;
}
  100599:	5b                   	pop    %ebx
  10059a:	c3                   	ret    

0010059b <strlen>:

size_t
strlen(const char *s)
{
  10059b:	8b 54 24 04          	mov    0x4(%esp),%edx
  10059f:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005a1:	eb 01                	jmp    1005a4 <strlen+0x9>
		++n;
  1005a3:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005a4:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  1005a8:	75 f9                	jne    1005a3 <strlen+0x8>
		++n;
	return n;
}
  1005aa:	c3                   	ret    

001005ab <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  1005ab:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1005af:	31 c0                	xor    %eax,%eax
  1005b1:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005b5:	eb 01                	jmp    1005b8 <strnlen+0xd>
		++n;
  1005b7:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005b8:	39 d0                	cmp    %edx,%eax
  1005ba:	74 06                	je     1005c2 <strnlen+0x17>
  1005bc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  1005c0:	75 f5                	jne    1005b7 <strnlen+0xc>
		++n;
	return n;
}
  1005c2:	c3                   	ret    

001005c3 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005c3:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  1005c4:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005c9:	53                   	push   %ebx
  1005ca:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  1005cc:	76 05                	jbe    1005d3 <console_putc+0x10>
  1005ce:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  1005d3:	80 fa 0a             	cmp    $0xa,%dl
  1005d6:	75 2c                	jne    100604 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005d8:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  1005de:	be 50 00 00 00       	mov    $0x50,%esi
  1005e3:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  1005e5:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005e8:	99                   	cltd   
  1005e9:	f7 fe                	idiv   %esi
  1005eb:	89 de                	mov    %ebx,%esi
  1005ed:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  1005ef:	eb 07                	jmp    1005f8 <console_putc+0x35>
			*cursor++ = ' ' | color;
  1005f1:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005f4:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  1005f5:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005f8:	83 f8 50             	cmp    $0x50,%eax
  1005fb:	75 f4                	jne    1005f1 <console_putc+0x2e>
  1005fd:	29 d0                	sub    %edx,%eax
  1005ff:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  100602:	eb 0b                	jmp    10060f <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  100604:	0f b6 d2             	movzbl %dl,%edx
  100607:	09 ca                	or     %ecx,%edx
  100609:	66 89 13             	mov    %dx,(%ebx)
  10060c:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  10060f:	5b                   	pop    %ebx
  100610:	5e                   	pop    %esi
  100611:	c3                   	ret    

00100612 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  100612:	56                   	push   %esi
  100613:	53                   	push   %ebx
  100614:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  100618:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10061b:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  10061f:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  100624:	75 04                	jne    10062a <fill_numbuf+0x18>
  100626:	85 d2                	test   %edx,%edx
  100628:	74 10                	je     10063a <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  10062a:	89 d0                	mov    %edx,%eax
  10062c:	31 d2                	xor    %edx,%edx
  10062e:	f7 f1                	div    %ecx
  100630:	4b                   	dec    %ebx
  100631:	8a 14 16             	mov    (%esi,%edx,1),%dl
  100634:	88 13                	mov    %dl,(%ebx)
			val /= base;
  100636:	89 c2                	mov    %eax,%edx
  100638:	eb ec                	jmp    100626 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  10063a:	89 d8                	mov    %ebx,%eax
  10063c:	5b                   	pop    %ebx
  10063d:	5e                   	pop    %esi
  10063e:	c3                   	ret    

0010063f <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  10063f:	55                   	push   %ebp
  100640:	57                   	push   %edi
  100641:	56                   	push   %esi
  100642:	53                   	push   %ebx
  100643:	83 ec 38             	sub    $0x38,%esp
  100646:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  10064a:	8b 7c 24 54          	mov    0x54(%esp),%edi
  10064e:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100652:	e9 60 03 00 00       	jmp    1009b7 <console_vprintf+0x378>
		if (*format != '%') {
  100657:	80 fa 25             	cmp    $0x25,%dl
  10065a:	74 13                	je     10066f <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  10065c:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100660:	0f b6 d2             	movzbl %dl,%edx
  100663:	89 f0                	mov    %esi,%eax
  100665:	e8 59 ff ff ff       	call   1005c3 <console_putc>
  10066a:	e9 45 03 00 00       	jmp    1009b4 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10066f:	47                   	inc    %edi
  100670:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  100677:	00 
  100678:	eb 12                	jmp    10068c <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  10067a:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  10067b:	8a 11                	mov    (%ecx),%dl
  10067d:	84 d2                	test   %dl,%dl
  10067f:	74 1a                	je     10069b <console_vprintf+0x5c>
  100681:	89 e8                	mov    %ebp,%eax
  100683:	38 c2                	cmp    %al,%dl
  100685:	75 f3                	jne    10067a <console_vprintf+0x3b>
  100687:	e9 3f 03 00 00       	jmp    1009cb <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10068c:	8a 17                	mov    (%edi),%dl
  10068e:	84 d2                	test   %dl,%dl
  100690:	74 0b                	je     10069d <console_vprintf+0x5e>
  100692:	b9 44 0a 10 00       	mov    $0x100a44,%ecx
  100697:	89 d5                	mov    %edx,%ebp
  100699:	eb e0                	jmp    10067b <console_vprintf+0x3c>
  10069b:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  10069d:	8d 42 cf             	lea    -0x31(%edx),%eax
  1006a0:	3c 08                	cmp    $0x8,%al
  1006a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1006a9:	00 
  1006aa:	76 13                	jbe    1006bf <console_vprintf+0x80>
  1006ac:	eb 1d                	jmp    1006cb <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  1006ae:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  1006b3:	0f be c0             	movsbl %al,%eax
  1006b6:	47                   	inc    %edi
  1006b7:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  1006bb:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  1006bf:	8a 07                	mov    (%edi),%al
  1006c1:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006c4:	80 fa 09             	cmp    $0x9,%dl
  1006c7:	76 e5                	jbe    1006ae <console_vprintf+0x6f>
  1006c9:	eb 18                	jmp    1006e3 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  1006cb:	80 fa 2a             	cmp    $0x2a,%dl
  1006ce:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  1006d5:	ff 
  1006d6:	75 0b                	jne    1006e3 <console_vprintf+0xa4>
			width = va_arg(val, int);
  1006d8:	83 c3 04             	add    $0x4,%ebx
			++format;
  1006db:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  1006dc:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1006df:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  1006e3:	83 cd ff             	or     $0xffffffff,%ebp
  1006e6:	80 3f 2e             	cmpb   $0x2e,(%edi)
  1006e9:	75 37                	jne    100722 <console_vprintf+0xe3>
			++format;
  1006eb:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  1006ec:	31 ed                	xor    %ebp,%ebp
  1006ee:	8a 07                	mov    (%edi),%al
  1006f0:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006f3:	80 fa 09             	cmp    $0x9,%dl
  1006f6:	76 0d                	jbe    100705 <console_vprintf+0xc6>
  1006f8:	eb 17                	jmp    100711 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  1006fa:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1006fd:	0f be c0             	movsbl %al,%eax
  100700:	47                   	inc    %edi
  100701:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  100705:	8a 07                	mov    (%edi),%al
  100707:	8d 50 d0             	lea    -0x30(%eax),%edx
  10070a:	80 fa 09             	cmp    $0x9,%dl
  10070d:	76 eb                	jbe    1006fa <console_vprintf+0xbb>
  10070f:	eb 11                	jmp    100722 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  100711:	3c 2a                	cmp    $0x2a,%al
  100713:	75 0b                	jne    100720 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  100715:	83 c3 04             	add    $0x4,%ebx
				++format;
  100718:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  100719:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  10071c:	85 ed                	test   %ebp,%ebp
  10071e:	79 02                	jns    100722 <console_vprintf+0xe3>
  100720:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  100722:	8a 07                	mov    (%edi),%al
  100724:	3c 64                	cmp    $0x64,%al
  100726:	74 34                	je     10075c <console_vprintf+0x11d>
  100728:	7f 1d                	jg     100747 <console_vprintf+0x108>
  10072a:	3c 58                	cmp    $0x58,%al
  10072c:	0f 84 a2 00 00 00    	je     1007d4 <console_vprintf+0x195>
  100732:	3c 63                	cmp    $0x63,%al
  100734:	0f 84 bf 00 00 00    	je     1007f9 <console_vprintf+0x1ba>
  10073a:	3c 43                	cmp    $0x43,%al
  10073c:	0f 85 d0 00 00 00    	jne    100812 <console_vprintf+0x1d3>
  100742:	e9 a3 00 00 00       	jmp    1007ea <console_vprintf+0x1ab>
  100747:	3c 75                	cmp    $0x75,%al
  100749:	74 4d                	je     100798 <console_vprintf+0x159>
  10074b:	3c 78                	cmp    $0x78,%al
  10074d:	74 5c                	je     1007ab <console_vprintf+0x16c>
  10074f:	3c 73                	cmp    $0x73,%al
  100751:	0f 85 bb 00 00 00    	jne    100812 <console_vprintf+0x1d3>
  100757:	e9 86 00 00 00       	jmp    1007e2 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  10075c:	83 c3 04             	add    $0x4,%ebx
  10075f:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  100762:	89 d1                	mov    %edx,%ecx
  100764:	c1 f9 1f             	sar    $0x1f,%ecx
  100767:	89 0c 24             	mov    %ecx,(%esp)
  10076a:	31 ca                	xor    %ecx,%edx
  10076c:	55                   	push   %ebp
  10076d:	29 ca                	sub    %ecx,%edx
  10076f:	68 4c 0a 10 00       	push   $0x100a4c
  100774:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100779:	8d 44 24 40          	lea    0x40(%esp),%eax
  10077d:	e8 90 fe ff ff       	call   100612 <fill_numbuf>
  100782:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  100786:	58                   	pop    %eax
  100787:	5a                   	pop    %edx
  100788:	ba 01 00 00 00       	mov    $0x1,%edx
  10078d:	8b 04 24             	mov    (%esp),%eax
  100790:	83 e0 01             	and    $0x1,%eax
  100793:	e9 a5 00 00 00       	jmp    10083d <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  100798:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  10079b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1007a0:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007a3:	55                   	push   %ebp
  1007a4:	68 4c 0a 10 00       	push   $0x100a4c
  1007a9:	eb 11                	jmp    1007bc <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  1007ab:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  1007ae:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007b1:	55                   	push   %ebp
  1007b2:	68 60 0a 10 00       	push   $0x100a60
  1007b7:	b9 10 00 00 00       	mov    $0x10,%ecx
  1007bc:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007c0:	e8 4d fe ff ff       	call   100612 <fill_numbuf>
  1007c5:	ba 01 00 00 00       	mov    $0x1,%edx
  1007ca:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1007ce:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  1007d0:	59                   	pop    %ecx
  1007d1:	59                   	pop    %ecx
  1007d2:	eb 69                	jmp    10083d <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  1007d4:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  1007d7:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007da:	55                   	push   %ebp
  1007db:	68 4c 0a 10 00       	push   $0x100a4c
  1007e0:	eb d5                	jmp    1007b7 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  1007e2:	83 c3 04             	add    $0x4,%ebx
  1007e5:	8b 43 fc             	mov    -0x4(%ebx),%eax
  1007e8:	eb 40                	jmp    10082a <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  1007ea:	83 c3 04             	add    $0x4,%ebx
  1007ed:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007f0:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  1007f4:	e9 bd 01 00 00       	jmp    1009b6 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007f9:	83 c3 04             	add    $0x4,%ebx
  1007fc:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1007ff:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  100803:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  100808:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  10080c:	88 44 24 24          	mov    %al,0x24(%esp)
  100810:	eb 27                	jmp    100839 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  100812:	84 c0                	test   %al,%al
  100814:	75 02                	jne    100818 <console_vprintf+0x1d9>
  100816:	b0 25                	mov    $0x25,%al
  100818:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  10081c:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  100821:	80 3f 00             	cmpb   $0x0,(%edi)
  100824:	74 0a                	je     100830 <console_vprintf+0x1f1>
  100826:	8d 44 24 24          	lea    0x24(%esp),%eax
  10082a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10082e:	eb 09                	jmp    100839 <console_vprintf+0x1fa>
				format--;
  100830:	8d 54 24 24          	lea    0x24(%esp),%edx
  100834:	4f                   	dec    %edi
  100835:	89 54 24 04          	mov    %edx,0x4(%esp)
  100839:	31 d2                	xor    %edx,%edx
  10083b:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10083d:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  10083f:	83 fd ff             	cmp    $0xffffffff,%ebp
  100842:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100849:	74 1f                	je     10086a <console_vprintf+0x22b>
  10084b:	89 04 24             	mov    %eax,(%esp)
  10084e:	eb 01                	jmp    100851 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100850:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100851:	39 e9                	cmp    %ebp,%ecx
  100853:	74 0a                	je     10085f <console_vprintf+0x220>
  100855:	8b 44 24 04          	mov    0x4(%esp),%eax
  100859:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  10085d:	75 f1                	jne    100850 <console_vprintf+0x211>
  10085f:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100862:	89 0c 24             	mov    %ecx,(%esp)
  100865:	eb 1f                	jmp    100886 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  100867:	42                   	inc    %edx
  100868:	eb 09                	jmp    100873 <console_vprintf+0x234>
  10086a:	89 d1                	mov    %edx,%ecx
  10086c:	8b 14 24             	mov    (%esp),%edx
  10086f:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100873:	8b 44 24 04          	mov    0x4(%esp),%eax
  100877:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  10087b:	75 ea                	jne    100867 <console_vprintf+0x228>
  10087d:	8b 44 24 08          	mov    0x8(%esp),%eax
  100881:	89 14 24             	mov    %edx,(%esp)
  100884:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  100886:	85 c0                	test   %eax,%eax
  100888:	74 0c                	je     100896 <console_vprintf+0x257>
  10088a:	84 d2                	test   %dl,%dl
  10088c:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  100893:	00 
  100894:	75 24                	jne    1008ba <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  100896:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  10089b:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  1008a2:	00 
  1008a3:	75 15                	jne    1008ba <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  1008a5:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008a9:	83 e0 08             	and    $0x8,%eax
  1008ac:	83 f8 01             	cmp    $0x1,%eax
  1008af:	19 c9                	sbb    %ecx,%ecx
  1008b1:	f7 d1                	not    %ecx
  1008b3:	83 e1 20             	and    $0x20,%ecx
  1008b6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  1008ba:	3b 2c 24             	cmp    (%esp),%ebp
  1008bd:	7e 0d                	jle    1008cc <console_vprintf+0x28d>
  1008bf:	84 d2                	test   %dl,%dl
  1008c1:	74 40                	je     100903 <console_vprintf+0x2c4>
			zeros = precision - len;
  1008c3:	2b 2c 24             	sub    (%esp),%ebp
  1008c6:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  1008ca:	eb 3f                	jmp    10090b <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008cc:	84 d2                	test   %dl,%dl
  1008ce:	74 33                	je     100903 <console_vprintf+0x2c4>
  1008d0:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008d4:	83 e0 06             	and    $0x6,%eax
  1008d7:	83 f8 02             	cmp    $0x2,%eax
  1008da:	75 27                	jne    100903 <console_vprintf+0x2c4>
  1008dc:	45                   	inc    %ebp
  1008dd:	75 24                	jne    100903 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008df:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008e1:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008e4:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008e9:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008ec:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  1008ef:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  1008f3:	7d 0e                	jge    100903 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  1008f5:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1008f9:	29 ca                	sub    %ecx,%edx
  1008fb:	29 c2                	sub    %eax,%edx
  1008fd:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100901:	eb 08                	jmp    10090b <console_vprintf+0x2cc>
  100903:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  10090a:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  10090b:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  10090f:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100911:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100915:	2b 2c 24             	sub    (%esp),%ebp
  100918:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  10091d:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100920:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100923:	29 c5                	sub    %eax,%ebp
  100925:	89 f0                	mov    %esi,%eax
  100927:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10092b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10092f:	eb 0f                	jmp    100940 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  100931:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100935:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10093a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  10093b:	e8 83 fc ff ff       	call   1005c3 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100940:	85 ed                	test   %ebp,%ebp
  100942:	7e 07                	jle    10094b <console_vprintf+0x30c>
  100944:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100949:	74 e6                	je     100931 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  10094b:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100950:	89 c6                	mov    %eax,%esi
  100952:	74 23                	je     100977 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  100954:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100959:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10095d:	e8 61 fc ff ff       	call   1005c3 <console_putc>
  100962:	89 c6                	mov    %eax,%esi
  100964:	eb 11                	jmp    100977 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  100966:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10096a:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  10096f:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100970:	e8 4e fc ff ff       	call   1005c3 <console_putc>
  100975:	eb 06                	jmp    10097d <console_vprintf+0x33e>
  100977:	89 f0                	mov    %esi,%eax
  100979:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  10097d:	85 f6                	test   %esi,%esi
  10097f:	7f e5                	jg     100966 <console_vprintf+0x327>
  100981:	8b 34 24             	mov    (%esp),%esi
  100984:	eb 15                	jmp    10099b <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  100986:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10098a:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  10098b:	0f b6 11             	movzbl (%ecx),%edx
  10098e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100992:	e8 2c fc ff ff       	call   1005c3 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100997:	ff 44 24 04          	incl   0x4(%esp)
  10099b:	85 f6                	test   %esi,%esi
  10099d:	7f e7                	jg     100986 <console_vprintf+0x347>
  10099f:	eb 0f                	jmp    1009b0 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  1009a1:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009a5:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009aa:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  1009ab:	e8 13 fc ff ff       	call   1005c3 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009b0:	85 ed                	test   %ebp,%ebp
  1009b2:	7f ed                	jg     1009a1 <console_vprintf+0x362>
  1009b4:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  1009b6:	47                   	inc    %edi
  1009b7:	8a 17                	mov    (%edi),%dl
  1009b9:	84 d2                	test   %dl,%dl
  1009bb:	0f 85 96 fc ff ff    	jne    100657 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  1009c1:	83 c4 38             	add    $0x38,%esp
  1009c4:	89 f0                	mov    %esi,%eax
  1009c6:	5b                   	pop    %ebx
  1009c7:	5e                   	pop    %esi
  1009c8:	5f                   	pop    %edi
  1009c9:	5d                   	pop    %ebp
  1009ca:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009cb:	81 e9 44 0a 10 00    	sub    $0x100a44,%ecx
  1009d1:	b8 01 00 00 00       	mov    $0x1,%eax
  1009d6:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1009d8:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009d9:	09 44 24 14          	or     %eax,0x14(%esp)
  1009dd:	e9 aa fc ff ff       	jmp    10068c <console_vprintf+0x4d>

001009e2 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  1009e2:	8d 44 24 10          	lea    0x10(%esp),%eax
  1009e6:	50                   	push   %eax
  1009e7:	ff 74 24 10          	pushl  0x10(%esp)
  1009eb:	ff 74 24 10          	pushl  0x10(%esp)
  1009ef:	ff 74 24 10          	pushl  0x10(%esp)
  1009f3:	e8 47 fc ff ff       	call   10063f <console_vprintf>
  1009f8:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  1009fb:	c3                   	ret    
