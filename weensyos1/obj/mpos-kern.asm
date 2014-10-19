
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
  100014:	e8 de 01 00 00       	call   1001f7 <start>
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
  10008f:	a1 bc 9e 10 00       	mov    0x109ebc,%eax
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
  1000a1:	6b c2 50             	imul   $0x50,%edx,%eax
  1000a4:	83 b8 9c 91 10 00 01 	cmpl   $0x1,0x10919c(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 54 91 10 00       	add    $0x109154,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 55 03 00 00       	call   100410 <run>

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
  1000c7:	8b 1d bc 9e 10 00    	mov    0x109ebc,%ebx

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
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 04             	cmp    $0x4,%eax
  1000e1:	0f 87 0e 01 00 00    	ja     1001f5 <interrupt+0x13a>
  1000e7:	ff 24 85 c8 09 10 00 	jmp    *0x1009c8(,%eax,4)
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
  1000f3:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	e9 92 00 00 00       	jmp    10018e <interrupt+0xd3>
  1000fc:	b8 ec 91 10 00       	mov    $0x1091ec,%eax
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
  100113:	83 c0 50             	add    $0x50,%eax
  100116:	83 fa 10             	cmp    $0x10,%edx
  100119:	75 eb                	jne    100106 <interrupt+0x4b>
  10011b:	eb 62                	jmp    10017f <interrupt+0xc4>
		if(proc_array[i].p_state == P_EMPTY) {
			avail_proc_desc = &(proc_array[i]);
  10011d:	6b d2 50             	imul   $0x50,%edx,%edx
	}
	if(i == NPROCS)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
  100120:	b9 11 00 00 00       	mov    $0x11,%ecx
  100125:	8d 73 04             	lea    0x4(%ebx),%esi
	process_t *avail_proc_desc;

	// Find an empty process descriptor
	for(i = 1; i != NPROCS; ++i) {
		if(proc_array[i].p_state == P_EMPTY) {
			avail_proc_desc = &(proc_array[i]);
  100128:	8d aa 54 91 10 00    	lea    0x109154(%edx),%ebp

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
  10012e:	8b 82 54 91 10 00    	mov    0x109154(%edx),%eax
	}
	if(i == NPROCS)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
  100134:	8d 7d 04             	lea    0x4(%ebp),%edi
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
  10013e:	8b 73 40             	mov    0x40(%ebx),%esi

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
  10015a:	e8 89 03 00 00       	call   1004e8 <memcpy>
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
  100166:	89 75 40             	mov    %esi,0x40(%ebp)
		return -1; // No empty process descriptor :(
	
	// Init process descriptor as running process (copy parent regs and stack)
	avail_proc_desc->p_registers = parent->p_registers;
	copy_stack(avail_proc_desc, parent);
	avail_proc_desc->p_state = P_RUNNABLE;
  100169:	c7 45 48 01 00 00 00 	movl   $0x1,0x48(%ebp)
	
	avail_proc_desc->p_registers.reg_eax = 0;
  100170:	c7 45 20 00 00 00 00 	movl   $0x0,0x20(%ebp)
	return avail_proc_desc->p_pid;
  100177:	8b 82 54 91 10 00    	mov    0x109154(%edx),%eax
  10017d:	eb 03                	jmp    100182 <interrupt+0xc7>
  10017f:	83 c8 ff             	or     $0xffffffff,%eax
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  100182:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  100185:	83 ec 0c             	sub    $0xc,%esp
  100188:	ff 35 bc 9e 10 00    	pushl  0x109ebc
  10018e:	e8 7d 02 00 00       	call   100410 <run>
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
  100198:	a1 bc 9e 10 00       	mov    0x109ebc,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  10019d:	8b 50 20             	mov    0x20(%eax),%edx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  1001a0:	c7 40 48 03 00 00 00 	movl   $0x3,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  1001a7:	89 50 4c             	mov    %edx,0x4c(%eax)
		schedule();
  1001aa:	e8 dd fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001af:	a1 bc 9e 10 00       	mov    0x109ebc,%eax
  1001b4:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001b7:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001ba:	83 f9 0e             	cmp    $0xe,%ecx
  1001bd:	77 11                	ja     1001d0 <interrupt+0x115>
  1001bf:	3b 10                	cmp    (%eax),%edx
  1001c1:	74 0d                	je     1001d0 <interrupt+0x115>
		    || proc_array[p].p_state == P_EMPTY)
  1001c3:	6b d2 50             	imul   $0x50,%edx,%edx
  1001c6:	8b 8a 9c 91 10 00    	mov    0x10919c(%edx),%ecx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001cc:	85 c9                	test   %ecx,%ecx
  1001ce:	75 09                	jne    1001d9 <interrupt+0x11e>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001d0:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001d7:	eb 17                	jmp    1001f0 <interrupt+0x135>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  1001d9:	83 f9 03             	cmp    $0x3,%ecx
  1001dc:	75 0b                	jne    1001e9 <interrupt+0x12e>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1001de:	8b 92 a0 91 10 00    	mov    0x1091a0(%edx),%edx
  1001e4:	89 50 20             	mov    %edx,0x20(%eax)
  1001e7:	eb 07                	jmp    1001f0 <interrupt+0x135>
		else
			current->p_registers.reg_eax = WAIT_TRYAGAIN;
  1001e9:	c7 40 20 fe ff ff ff 	movl   $0xfffffffe,0x20(%eax)
		schedule();
  1001f0:	e8 97 fe ff ff       	call   10008c <schedule>
  1001f5:	eb fe                	jmp    1001f5 <interrupt+0x13a>

001001f7 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  1001f7:	53                   	push   %ebx
  1001f8:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  1001fb:	68 00 05 00 00       	push   $0x500
  100200:	6a 00                	push   $0x0
  100202:	68 54 91 10 00       	push   $0x109154
  100207:	e8 40 03 00 00       	call   10054c <memset>
  10020c:	ba 54 91 10 00       	mov    $0x109154,%edx
  100211:	31 c0                	xor    %eax,%eax
  100213:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100216:	89 02                	mov    %eax,(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100218:	40                   	inc    %eax
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  100219:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100220:	83 c2 50             	add    $0x50,%edx
  100223:	83 f8 10             	cmp    $0x10,%eax
  100226:	75 ee                	jne    100216 <start+0x1f>
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  100228:	c7 05 bc 9e 10 00 a4 	movl   $0x1091a4,0x109ebc
  10022f:	91 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100232:	e8 71 00 00 00       	call   1002a8 <segments_init>
	special_registers_init(current);
  100237:	83 ec 0c             	sub    $0xc,%esp
  10023a:	ff 35 bc 9e 10 00    	pushl  0x109ebc
  100240:	e8 e2 01 00 00       	call   100427 <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  100245:	e8 2d 01 00 00       	call   100377 <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  10024a:	83 c4 0c             	add    $0xc,%esp
  10024d:	68 dc 09 10 00       	push   $0x1009dc
  100252:	68 00 07 00 00       	push   $0x700
  100257:	ff 35 00 00 06 00    	pushl  0x60000
  10025d:	e8 4c 07 00 00       	call   1009ae <console_printf>
  100262:	83 c4 10             	add    $0x10,%esp
  100265:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  10026a:	e8 4b 01 00 00       	call   1003ba <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  10026f:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100272:	83 fb 01             	cmp    $0x1,%ebx
  100275:	77 f3                	ja     10026a <start+0x73>
	console_clear();
  100277:	e8 fb 00 00 00       	call   100377 <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  10027c:	50                   	push   %eax
  10027d:	50                   	push   %eax
  10027e:	a1 bc 9e 10 00       	mov    0x109ebc,%eax
  100283:	83 c0 34             	add    $0x34,%eax
  100286:	50                   	push   %eax
  100287:	53                   	push   %ebx
  100288:	e8 cf 01 00 00       	call   10045c <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  10028d:	a1 bc 9e 10 00       	mov    0x109ebc,%eax
  100292:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  100299:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  1002a0:	89 04 24             	mov    %eax,(%esp)
  1002a3:	e8 68 01 00 00       	call   100410 <run>

001002a8 <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002a8:	b8 54 96 10 00       	mov    $0x109654,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002ad:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002b2:	89 c2                	mov    %eax,%edx
  1002b4:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  1002b7:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002b8:	bb 56 00 10 00       	mov    $0x100056,%ebx
  1002bd:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002c0:	66 a3 7a 1a 10 00    	mov    %ax,0x101a7a
  1002c6:	c1 e8 18             	shr    $0x18,%eax
  1002c9:	88 15 7c 1a 10 00    	mov    %dl,0x101a7c
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002cf:	ba bc 96 10 00       	mov    $0x1096bc,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002d4:	a2 7f 1a 10 00       	mov    %al,0x101a7f
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002d9:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002db:	66 c7 05 78 1a 10 00 	movw   $0x68,0x101a78
  1002e2:	68 00 
  1002e4:	c6 05 7e 1a 10 00 40 	movb   $0x40,0x101a7e
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  1002eb:	c6 05 7d 1a 10 00 89 	movb   $0x89,0x101a7d

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  1002f2:	c7 05 58 96 10 00 00 	movl   $0x80000,0x109658
  1002f9:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  1002fc:	66 c7 05 5c 96 10 00 	movw   $0x10,0x10965c
  100303:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100305:	66 89 0c c5 bc 96 10 	mov    %cx,0x1096bc(,%eax,8)
  10030c:	00 
  10030d:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100314:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100319:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  10031e:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  100323:	40                   	inc    %eax
  100324:	3d 00 01 00 00       	cmp    $0x100,%eax
  100329:	75 da                	jne    100305 <segments_init+0x5d>
  10032b:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  10032f:	ba bc 96 10 00       	mov    $0x1096bc,%edx
  100334:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  10033b:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100342:	66 89 0c c5 bc 96 10 	mov    %cx,0x1096bc(,%eax,8)
  100349:	00 
  10034a:	c1 e9 10             	shr    $0x10,%ecx
  10034d:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100352:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  100357:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  10035c:	40                   	inc    %eax
  10035d:	83 f8 3a             	cmp    $0x3a,%eax
  100360:	75 d2                	jne    100334 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  100362:	b0 28                	mov    $0x28,%al
  100364:	0f 01 15 40 1a 10 00 	lgdtl  0x101a40
  10036b:	0f 00 d8             	ltr    %ax
  10036e:	0f 01 1d 48 1a 10 00 	lidtl  0x101a48
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  100375:	5b                   	pop    %ebx
  100376:	c3                   	ret    

00100377 <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  100377:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100378:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  10037a:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  10037b:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  100382:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  100385:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  10038c:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  10038f:	40                   	inc    %eax
  100390:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100395:	75 ee                	jne    100385 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100397:	be d4 03 00 00       	mov    $0x3d4,%esi
  10039c:	b0 0e                	mov    $0xe,%al
  10039e:	89 f2                	mov    %esi,%edx
  1003a0:	ee                   	out    %al,(%dx)
  1003a1:	31 c9                	xor    %ecx,%ecx
  1003a3:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1003a8:	88 c8                	mov    %cl,%al
  1003aa:	89 da                	mov    %ebx,%edx
  1003ac:	ee                   	out    %al,(%dx)
  1003ad:	b0 0f                	mov    $0xf,%al
  1003af:	89 f2                	mov    %esi,%edx
  1003b1:	ee                   	out    %al,(%dx)
  1003b2:	88 c8                	mov    %cl,%al
  1003b4:	89 da                	mov    %ebx,%edx
  1003b6:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  1003b7:	5b                   	pop    %ebx
  1003b8:	5e                   	pop    %esi
  1003b9:	c3                   	ret    

001003ba <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1003ba:	ba 64 00 00 00       	mov    $0x64,%edx
  1003bf:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  1003c0:	a8 01                	test   $0x1,%al
  1003c2:	74 45                	je     100409 <console_read_digit+0x4f>
  1003c4:	b2 60                	mov    $0x60,%dl
  1003c6:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  1003c7:	8d 50 fe             	lea    -0x2(%eax),%edx
  1003ca:	80 fa 08             	cmp    $0x8,%dl
  1003cd:	77 05                	ja     1003d4 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  1003cf:	0f b6 c0             	movzbl %al,%eax
  1003d2:	48                   	dec    %eax
  1003d3:	c3                   	ret    
	else if (data == 0x0B)
  1003d4:	3c 0b                	cmp    $0xb,%al
  1003d6:	74 35                	je     10040d <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  1003d8:	8d 50 b9             	lea    -0x47(%eax),%edx
  1003db:	80 fa 02             	cmp    $0x2,%dl
  1003de:	77 07                	ja     1003e7 <console_read_digit+0x2d>
		return data - 0x47 + 7;
  1003e0:	0f b6 c0             	movzbl %al,%eax
  1003e3:	83 e8 40             	sub    $0x40,%eax
  1003e6:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  1003e7:	8d 50 b5             	lea    -0x4b(%eax),%edx
  1003ea:	80 fa 02             	cmp    $0x2,%dl
  1003ed:	77 07                	ja     1003f6 <console_read_digit+0x3c>
		return data - 0x4B + 4;
  1003ef:	0f b6 c0             	movzbl %al,%eax
  1003f2:	83 e8 47             	sub    $0x47,%eax
  1003f5:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  1003f6:	8d 50 b1             	lea    -0x4f(%eax),%edx
  1003f9:	80 fa 02             	cmp    $0x2,%dl
  1003fc:	77 07                	ja     100405 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  1003fe:	0f b6 c0             	movzbl %al,%eax
  100401:	83 e8 4e             	sub    $0x4e,%eax
  100404:	c3                   	ret    
	else if (data == 0x53)
  100405:	3c 53                	cmp    $0x53,%al
  100407:	74 04                	je     10040d <console_read_digit+0x53>
  100409:	83 c8 ff             	or     $0xffffffff,%eax
  10040c:	c3                   	ret    
  10040d:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  10040f:	c3                   	ret    

00100410 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  100410:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100414:	a3 bc 9e 10 00       	mov    %eax,0x109ebc

	asm volatile("movl %0,%%esp\n\t"
  100419:	83 c0 04             	add    $0x4,%eax
  10041c:	89 c4                	mov    %eax,%esp
  10041e:	61                   	popa   
  10041f:	07                   	pop    %es
  100420:	1f                   	pop    %ds
  100421:	83 c4 08             	add    $0x8,%esp
  100424:	cf                   	iret   
  100425:	eb fe                	jmp    100425 <run+0x15>

00100427 <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  100427:	53                   	push   %ebx
  100428:	83 ec 0c             	sub    $0xc,%esp
  10042b:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  10042f:	6a 44                	push   $0x44
  100431:	6a 00                	push   $0x0
  100433:	8d 43 04             	lea    0x4(%ebx),%eax
  100436:	50                   	push   %eax
  100437:	e8 10 01 00 00       	call   10054c <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  10043c:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  100442:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  100448:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  10044e:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  100454:	83 c4 18             	add    $0x18,%esp
  100457:	5b                   	pop    %ebx
  100458:	c3                   	ret    
  100459:	90                   	nop
  10045a:	90                   	nop
  10045b:	90                   	nop

0010045c <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  10045c:	55                   	push   %ebp
  10045d:	57                   	push   %edi
  10045e:	56                   	push   %esi
  10045f:	53                   	push   %ebx
  100460:	83 ec 1c             	sub    $0x1c,%esp
  100463:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  100467:	83 f8 01             	cmp    $0x1,%eax
  10046a:	7f 04                	jg     100470 <program_loader+0x14>
  10046c:	85 c0                	test   %eax,%eax
  10046e:	79 02                	jns    100472 <program_loader+0x16>
  100470:	eb fe                	jmp    100470 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  100472:	8b 34 c5 80 1a 10 00 	mov    0x101a80(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  100479:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  10047f:	74 02                	je     100483 <program_loader+0x27>
  100481:	eb fe                	jmp    100481 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  100483:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  100486:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  10048a:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  10048c:	c1 e5 05             	shl    $0x5,%ebp
  10048f:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  100492:	eb 3f                	jmp    1004d3 <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  100494:	83 3b 01             	cmpl   $0x1,(%ebx)
  100497:	75 37                	jne    1004d0 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  100499:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  10049c:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  10049f:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1004a2:	01 c7                	add    %eax,%edi
	memsz += va;
  1004a4:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  1004a6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  1004ab:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  1004af:	52                   	push   %edx
  1004b0:	89 fa                	mov    %edi,%edx
  1004b2:	29 c2                	sub    %eax,%edx
  1004b4:	52                   	push   %edx
  1004b5:	8b 53 04             	mov    0x4(%ebx),%edx
  1004b8:	01 f2                	add    %esi,%edx
  1004ba:	52                   	push   %edx
  1004bb:	50                   	push   %eax
  1004bc:	e8 27 00 00 00       	call   1004e8 <memcpy>
  1004c1:	83 c4 10             	add    $0x10,%esp
  1004c4:	eb 04                	jmp    1004ca <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  1004c6:	c6 07 00             	movb   $0x0,(%edi)
  1004c9:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1004ca:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  1004ce:	72 f6                	jb     1004c6 <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  1004d0:	83 c3 20             	add    $0x20,%ebx
  1004d3:	39 eb                	cmp    %ebp,%ebx
  1004d5:	72 bd                	jb     100494 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  1004d7:	8b 56 18             	mov    0x18(%esi),%edx
  1004da:	8b 44 24 34          	mov    0x34(%esp),%eax
  1004de:	89 10                	mov    %edx,(%eax)
}
  1004e0:	83 c4 1c             	add    $0x1c,%esp
  1004e3:	5b                   	pop    %ebx
  1004e4:	5e                   	pop    %esi
  1004e5:	5f                   	pop    %edi
  1004e6:	5d                   	pop    %ebp
  1004e7:	c3                   	ret    

001004e8 <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  1004e8:	56                   	push   %esi
  1004e9:	31 d2                	xor    %edx,%edx
  1004eb:	53                   	push   %ebx
  1004ec:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1004f0:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1004f4:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1004f8:	eb 08                	jmp    100502 <memcpy+0x1a>
		*d++ = *s++;
  1004fa:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  1004fd:	4e                   	dec    %esi
  1004fe:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100501:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100502:	85 f6                	test   %esi,%esi
  100504:	75 f4                	jne    1004fa <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  100506:	5b                   	pop    %ebx
  100507:	5e                   	pop    %esi
  100508:	c3                   	ret    

00100509 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  100509:	57                   	push   %edi
  10050a:	56                   	push   %esi
  10050b:	53                   	push   %ebx
  10050c:	8b 44 24 10          	mov    0x10(%esp),%eax
  100510:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100514:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  100518:	39 c7                	cmp    %eax,%edi
  10051a:	73 26                	jae    100542 <memmove+0x39>
  10051c:	8d 34 17             	lea    (%edi,%edx,1),%esi
  10051f:	39 c6                	cmp    %eax,%esi
  100521:	76 1f                	jbe    100542 <memmove+0x39>
		s += n, d += n;
  100523:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  100526:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  100528:	eb 07                	jmp    100531 <memmove+0x28>
			*--d = *--s;
  10052a:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  10052d:	4a                   	dec    %edx
  10052e:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100531:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  100532:	85 d2                	test   %edx,%edx
  100534:	75 f4                	jne    10052a <memmove+0x21>
  100536:	eb 10                	jmp    100548 <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  100538:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  10053b:	4a                   	dec    %edx
  10053c:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  10053f:	41                   	inc    %ecx
  100540:	eb 02                	jmp    100544 <memmove+0x3b>
  100542:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  100544:	85 d2                	test   %edx,%edx
  100546:	75 f0                	jne    100538 <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  100548:	5b                   	pop    %ebx
  100549:	5e                   	pop    %esi
  10054a:	5f                   	pop    %edi
  10054b:	c3                   	ret    

0010054c <memset>:

void *
memset(void *v, int c, size_t n)
{
  10054c:	53                   	push   %ebx
  10054d:	8b 44 24 08          	mov    0x8(%esp),%eax
  100551:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100555:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  100559:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  10055b:	eb 04                	jmp    100561 <memset+0x15>
		*p++ = c;
  10055d:	88 1a                	mov    %bl,(%edx)
  10055f:	49                   	dec    %ecx
  100560:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100561:	85 c9                	test   %ecx,%ecx
  100563:	75 f8                	jne    10055d <memset+0x11>
		*p++ = c;
	return v;
}
  100565:	5b                   	pop    %ebx
  100566:	c3                   	ret    

00100567 <strlen>:

size_t
strlen(const char *s)
{
  100567:	8b 54 24 04          	mov    0x4(%esp),%edx
  10056b:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  10056d:	eb 01                	jmp    100570 <strlen+0x9>
		++n;
  10056f:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100570:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100574:	75 f9                	jne    10056f <strlen+0x8>
		++n;
	return n;
}
  100576:	c3                   	ret    

00100577 <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  100577:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  10057b:	31 c0                	xor    %eax,%eax
  10057d:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100581:	eb 01                	jmp    100584 <strnlen+0xd>
		++n;
  100583:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100584:	39 d0                	cmp    %edx,%eax
  100586:	74 06                	je     10058e <strnlen+0x17>
  100588:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  10058c:	75 f5                	jne    100583 <strnlen+0xc>
		++n;
	return n;
}
  10058e:	c3                   	ret    

0010058f <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  10058f:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  100590:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100595:	53                   	push   %ebx
  100596:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  100598:	76 05                	jbe    10059f <console_putc+0x10>
  10059a:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  10059f:	80 fa 0a             	cmp    $0xa,%dl
  1005a2:	75 2c                	jne    1005d0 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005a4:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  1005aa:	be 50 00 00 00       	mov    $0x50,%esi
  1005af:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  1005b1:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005b4:	99                   	cltd   
  1005b5:	f7 fe                	idiv   %esi
  1005b7:	89 de                	mov    %ebx,%esi
  1005b9:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  1005bb:	eb 07                	jmp    1005c4 <console_putc+0x35>
			*cursor++ = ' ' | color;
  1005bd:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005c0:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  1005c1:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005c4:	83 f8 50             	cmp    $0x50,%eax
  1005c7:	75 f4                	jne    1005bd <console_putc+0x2e>
  1005c9:	29 d0                	sub    %edx,%eax
  1005cb:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  1005ce:	eb 0b                	jmp    1005db <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  1005d0:	0f b6 d2             	movzbl %dl,%edx
  1005d3:	09 ca                	or     %ecx,%edx
  1005d5:	66 89 13             	mov    %dx,(%ebx)
  1005d8:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  1005db:	5b                   	pop    %ebx
  1005dc:	5e                   	pop    %esi
  1005dd:	c3                   	ret    

001005de <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  1005de:	56                   	push   %esi
  1005df:	53                   	push   %ebx
  1005e0:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  1005e4:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1005e7:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  1005eb:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  1005f0:	75 04                	jne    1005f6 <fill_numbuf+0x18>
  1005f2:	85 d2                	test   %edx,%edx
  1005f4:	74 10                	je     100606 <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	31 d2                	xor    %edx,%edx
  1005fa:	f7 f1                	div    %ecx
  1005fc:	4b                   	dec    %ebx
  1005fd:	8a 14 16             	mov    (%esi,%edx,1),%dl
  100600:	88 13                	mov    %dl,(%ebx)
			val /= base;
  100602:	89 c2                	mov    %eax,%edx
  100604:	eb ec                	jmp    1005f2 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  100606:	89 d8                	mov    %ebx,%eax
  100608:	5b                   	pop    %ebx
  100609:	5e                   	pop    %esi
  10060a:	c3                   	ret    

0010060b <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  10060b:	55                   	push   %ebp
  10060c:	57                   	push   %edi
  10060d:	56                   	push   %esi
  10060e:	53                   	push   %ebx
  10060f:	83 ec 38             	sub    $0x38,%esp
  100612:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  100616:	8b 7c 24 54          	mov    0x54(%esp),%edi
  10061a:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10061e:	e9 60 03 00 00       	jmp    100983 <console_vprintf+0x378>
		if (*format != '%') {
  100623:	80 fa 25             	cmp    $0x25,%dl
  100626:	74 13                	je     10063b <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  100628:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10062c:	0f b6 d2             	movzbl %dl,%edx
  10062f:	89 f0                	mov    %esi,%eax
  100631:	e8 59 ff ff ff       	call   10058f <console_putc>
  100636:	e9 45 03 00 00       	jmp    100980 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10063b:	47                   	inc    %edi
  10063c:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  100643:	00 
  100644:	eb 12                	jmp    100658 <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  100646:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  100647:	8a 11                	mov    (%ecx),%dl
  100649:	84 d2                	test   %dl,%dl
  10064b:	74 1a                	je     100667 <console_vprintf+0x5c>
  10064d:	89 e8                	mov    %ebp,%eax
  10064f:	38 c2                	cmp    %al,%dl
  100651:	75 f3                	jne    100646 <console_vprintf+0x3b>
  100653:	e9 3f 03 00 00       	jmp    100997 <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100658:	8a 17                	mov    (%edi),%dl
  10065a:	84 d2                	test   %dl,%dl
  10065c:	74 0b                	je     100669 <console_vprintf+0x5e>
  10065e:	b9 10 0a 10 00       	mov    $0x100a10,%ecx
  100663:	89 d5                	mov    %edx,%ebp
  100665:	eb e0                	jmp    100647 <console_vprintf+0x3c>
  100667:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  100669:	8d 42 cf             	lea    -0x31(%edx),%eax
  10066c:	3c 08                	cmp    $0x8,%al
  10066e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  100675:	00 
  100676:	76 13                	jbe    10068b <console_vprintf+0x80>
  100678:	eb 1d                	jmp    100697 <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  10067a:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  10067f:	0f be c0             	movsbl %al,%eax
  100682:	47                   	inc    %edi
  100683:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  100687:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  10068b:	8a 07                	mov    (%edi),%al
  10068d:	8d 50 d0             	lea    -0x30(%eax),%edx
  100690:	80 fa 09             	cmp    $0x9,%dl
  100693:	76 e5                	jbe    10067a <console_vprintf+0x6f>
  100695:	eb 18                	jmp    1006af <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  100697:	80 fa 2a             	cmp    $0x2a,%dl
  10069a:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  1006a1:	ff 
  1006a2:	75 0b                	jne    1006af <console_vprintf+0xa4>
			width = va_arg(val, int);
  1006a4:	83 c3 04             	add    $0x4,%ebx
			++format;
  1006a7:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  1006a8:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1006ab:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  1006af:	83 cd ff             	or     $0xffffffff,%ebp
  1006b2:	80 3f 2e             	cmpb   $0x2e,(%edi)
  1006b5:	75 37                	jne    1006ee <console_vprintf+0xe3>
			++format;
  1006b7:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  1006b8:	31 ed                	xor    %ebp,%ebp
  1006ba:	8a 07                	mov    (%edi),%al
  1006bc:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006bf:	80 fa 09             	cmp    $0x9,%dl
  1006c2:	76 0d                	jbe    1006d1 <console_vprintf+0xc6>
  1006c4:	eb 17                	jmp    1006dd <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  1006c6:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1006c9:	0f be c0             	movsbl %al,%eax
  1006cc:	47                   	inc    %edi
  1006cd:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  1006d1:	8a 07                	mov    (%edi),%al
  1006d3:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006d6:	80 fa 09             	cmp    $0x9,%dl
  1006d9:	76 eb                	jbe    1006c6 <console_vprintf+0xbb>
  1006db:	eb 11                	jmp    1006ee <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  1006dd:	3c 2a                	cmp    $0x2a,%al
  1006df:	75 0b                	jne    1006ec <console_vprintf+0xe1>
				precision = va_arg(val, int);
  1006e1:	83 c3 04             	add    $0x4,%ebx
				++format;
  1006e4:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  1006e5:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  1006e8:	85 ed                	test   %ebp,%ebp
  1006ea:	79 02                	jns    1006ee <console_vprintf+0xe3>
  1006ec:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  1006ee:	8a 07                	mov    (%edi),%al
  1006f0:	3c 64                	cmp    $0x64,%al
  1006f2:	74 34                	je     100728 <console_vprintf+0x11d>
  1006f4:	7f 1d                	jg     100713 <console_vprintf+0x108>
  1006f6:	3c 58                	cmp    $0x58,%al
  1006f8:	0f 84 a2 00 00 00    	je     1007a0 <console_vprintf+0x195>
  1006fe:	3c 63                	cmp    $0x63,%al
  100700:	0f 84 bf 00 00 00    	je     1007c5 <console_vprintf+0x1ba>
  100706:	3c 43                	cmp    $0x43,%al
  100708:	0f 85 d0 00 00 00    	jne    1007de <console_vprintf+0x1d3>
  10070e:	e9 a3 00 00 00       	jmp    1007b6 <console_vprintf+0x1ab>
  100713:	3c 75                	cmp    $0x75,%al
  100715:	74 4d                	je     100764 <console_vprintf+0x159>
  100717:	3c 78                	cmp    $0x78,%al
  100719:	74 5c                	je     100777 <console_vprintf+0x16c>
  10071b:	3c 73                	cmp    $0x73,%al
  10071d:	0f 85 bb 00 00 00    	jne    1007de <console_vprintf+0x1d3>
  100723:	e9 86 00 00 00       	jmp    1007ae <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  100728:	83 c3 04             	add    $0x4,%ebx
  10072b:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  10072e:	89 d1                	mov    %edx,%ecx
  100730:	c1 f9 1f             	sar    $0x1f,%ecx
  100733:	89 0c 24             	mov    %ecx,(%esp)
  100736:	31 ca                	xor    %ecx,%edx
  100738:	55                   	push   %ebp
  100739:	29 ca                	sub    %ecx,%edx
  10073b:	68 18 0a 10 00       	push   $0x100a18
  100740:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100745:	8d 44 24 40          	lea    0x40(%esp),%eax
  100749:	e8 90 fe ff ff       	call   1005de <fill_numbuf>
  10074e:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  100752:	58                   	pop    %eax
  100753:	5a                   	pop    %edx
  100754:	ba 01 00 00 00       	mov    $0x1,%edx
  100759:	8b 04 24             	mov    (%esp),%eax
  10075c:	83 e0 01             	and    $0x1,%eax
  10075f:	e9 a5 00 00 00       	jmp    100809 <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  100764:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  100767:	b9 0a 00 00 00       	mov    $0xa,%ecx
  10076c:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10076f:	55                   	push   %ebp
  100770:	68 18 0a 10 00       	push   $0x100a18
  100775:	eb 11                	jmp    100788 <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  100777:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  10077a:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10077d:	55                   	push   %ebp
  10077e:	68 2c 0a 10 00       	push   $0x100a2c
  100783:	b9 10 00 00 00       	mov    $0x10,%ecx
  100788:	8d 44 24 40          	lea    0x40(%esp),%eax
  10078c:	e8 4d fe ff ff       	call   1005de <fill_numbuf>
  100791:	ba 01 00 00 00       	mov    $0x1,%edx
  100796:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10079a:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  10079c:	59                   	pop    %ecx
  10079d:	59                   	pop    %ecx
  10079e:	eb 69                	jmp    100809 <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  1007a0:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  1007a3:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007a6:	55                   	push   %ebp
  1007a7:	68 18 0a 10 00       	push   $0x100a18
  1007ac:	eb d5                	jmp    100783 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  1007ae:	83 c3 04             	add    $0x4,%ebx
  1007b1:	8b 43 fc             	mov    -0x4(%ebx),%eax
  1007b4:	eb 40                	jmp    1007f6 <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  1007b6:	83 c3 04             	add    $0x4,%ebx
  1007b9:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007bc:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  1007c0:	e9 bd 01 00 00       	jmp    100982 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007c5:	83 c3 04             	add    $0x4,%ebx
  1007c8:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1007cb:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  1007cf:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  1007d4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007d8:	88 44 24 24          	mov    %al,0x24(%esp)
  1007dc:	eb 27                	jmp    100805 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  1007de:	84 c0                	test   %al,%al
  1007e0:	75 02                	jne    1007e4 <console_vprintf+0x1d9>
  1007e2:	b0 25                	mov    $0x25,%al
  1007e4:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  1007e8:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  1007ed:	80 3f 00             	cmpb   $0x0,(%edi)
  1007f0:	74 0a                	je     1007fc <console_vprintf+0x1f1>
  1007f2:	8d 44 24 24          	lea    0x24(%esp),%eax
  1007f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fa:	eb 09                	jmp    100805 <console_vprintf+0x1fa>
				format--;
  1007fc:	8d 54 24 24          	lea    0x24(%esp),%edx
  100800:	4f                   	dec    %edi
  100801:	89 54 24 04          	mov    %edx,0x4(%esp)
  100805:	31 d2                	xor    %edx,%edx
  100807:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100809:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  10080b:	83 fd ff             	cmp    $0xffffffff,%ebp
  10080e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100815:	74 1f                	je     100836 <console_vprintf+0x22b>
  100817:	89 04 24             	mov    %eax,(%esp)
  10081a:	eb 01                	jmp    10081d <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  10081c:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  10081d:	39 e9                	cmp    %ebp,%ecx
  10081f:	74 0a                	je     10082b <console_vprintf+0x220>
  100821:	8b 44 24 04          	mov    0x4(%esp),%eax
  100825:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  100829:	75 f1                	jne    10081c <console_vprintf+0x211>
  10082b:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10082e:	89 0c 24             	mov    %ecx,(%esp)
  100831:	eb 1f                	jmp    100852 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  100833:	42                   	inc    %edx
  100834:	eb 09                	jmp    10083f <console_vprintf+0x234>
  100836:	89 d1                	mov    %edx,%ecx
  100838:	8b 14 24             	mov    (%esp),%edx
  10083b:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  10083f:	8b 44 24 04          	mov    0x4(%esp),%eax
  100843:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  100847:	75 ea                	jne    100833 <console_vprintf+0x228>
  100849:	8b 44 24 08          	mov    0x8(%esp),%eax
  10084d:	89 14 24             	mov    %edx,(%esp)
  100850:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  100852:	85 c0                	test   %eax,%eax
  100854:	74 0c                	je     100862 <console_vprintf+0x257>
  100856:	84 d2                	test   %dl,%dl
  100858:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  10085f:	00 
  100860:	75 24                	jne    100886 <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  100862:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  100867:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  10086e:	00 
  10086f:	75 15                	jne    100886 <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  100871:	8b 44 24 14          	mov    0x14(%esp),%eax
  100875:	83 e0 08             	and    $0x8,%eax
  100878:	83 f8 01             	cmp    $0x1,%eax
  10087b:	19 c9                	sbb    %ecx,%ecx
  10087d:	f7 d1                	not    %ecx
  10087f:	83 e1 20             	and    $0x20,%ecx
  100882:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  100886:	3b 2c 24             	cmp    (%esp),%ebp
  100889:	7e 0d                	jle    100898 <console_vprintf+0x28d>
  10088b:	84 d2                	test   %dl,%dl
  10088d:	74 40                	je     1008cf <console_vprintf+0x2c4>
			zeros = precision - len;
  10088f:	2b 2c 24             	sub    (%esp),%ebp
  100892:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  100896:	eb 3f                	jmp    1008d7 <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100898:	84 d2                	test   %dl,%dl
  10089a:	74 33                	je     1008cf <console_vprintf+0x2c4>
  10089c:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008a0:	83 e0 06             	and    $0x6,%eax
  1008a3:	83 f8 02             	cmp    $0x2,%eax
  1008a6:	75 27                	jne    1008cf <console_vprintf+0x2c4>
  1008a8:	45                   	inc    %ebp
  1008a9:	75 24                	jne    1008cf <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008ab:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008ad:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008b0:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008b5:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008b8:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  1008bb:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  1008bf:	7d 0e                	jge    1008cf <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  1008c1:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1008c5:	29 ca                	sub    %ecx,%edx
  1008c7:	29 c2                	sub    %eax,%edx
  1008c9:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008cd:	eb 08                	jmp    1008d7 <console_vprintf+0x2cc>
  1008cf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1008d6:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008d7:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1008db:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008dd:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008e1:	2b 2c 24             	sub    (%esp),%ebp
  1008e4:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008e9:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008ec:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008ef:	29 c5                	sub    %eax,%ebp
  1008f1:	89 f0                	mov    %esi,%eax
  1008f3:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008f7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1008fb:	eb 0f                	jmp    10090c <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  1008fd:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100901:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100906:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100907:	e8 83 fc ff ff       	call   10058f <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10090c:	85 ed                	test   %ebp,%ebp
  10090e:	7e 07                	jle    100917 <console_vprintf+0x30c>
  100910:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100915:	74 e6                	je     1008fd <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  100917:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  10091c:	89 c6                	mov    %eax,%esi
  10091e:	74 23                	je     100943 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  100920:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100925:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100929:	e8 61 fc ff ff       	call   10058f <console_putc>
  10092e:	89 c6                	mov    %eax,%esi
  100930:	eb 11                	jmp    100943 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  100932:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100936:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  10093b:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  10093c:	e8 4e fc ff ff       	call   10058f <console_putc>
  100941:	eb 06                	jmp    100949 <console_vprintf+0x33e>
  100943:	89 f0                	mov    %esi,%eax
  100945:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100949:	85 f6                	test   %esi,%esi
  10094b:	7f e5                	jg     100932 <console_vprintf+0x327>
  10094d:	8b 34 24             	mov    (%esp),%esi
  100950:	eb 15                	jmp    100967 <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  100952:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100956:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  100957:	0f b6 11             	movzbl (%ecx),%edx
  10095a:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10095e:	e8 2c fc ff ff       	call   10058f <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100963:	ff 44 24 04          	incl   0x4(%esp)
  100967:	85 f6                	test   %esi,%esi
  100969:	7f e7                	jg     100952 <console_vprintf+0x347>
  10096b:	eb 0f                	jmp    10097c <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  10096d:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100971:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100976:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100977:	e8 13 fc ff ff       	call   10058f <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  10097c:	85 ed                	test   %ebp,%ebp
  10097e:	7f ed                	jg     10096d <console_vprintf+0x362>
  100980:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100982:	47                   	inc    %edi
  100983:	8a 17                	mov    (%edi),%dl
  100985:	84 d2                	test   %dl,%dl
  100987:	0f 85 96 fc ff ff    	jne    100623 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  10098d:	83 c4 38             	add    $0x38,%esp
  100990:	89 f0                	mov    %esi,%eax
  100992:	5b                   	pop    %ebx
  100993:	5e                   	pop    %esi
  100994:	5f                   	pop    %edi
  100995:	5d                   	pop    %ebp
  100996:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100997:	81 e9 10 0a 10 00    	sub    $0x100a10,%ecx
  10099d:	b8 01 00 00 00       	mov    $0x1,%eax
  1009a2:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1009a4:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009a5:	09 44 24 14          	or     %eax,0x14(%esp)
  1009a9:	e9 aa fc ff ff       	jmp    100658 <console_vprintf+0x4d>

001009ae <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  1009ae:	8d 44 24 10          	lea    0x10(%esp),%eax
  1009b2:	50                   	push   %eax
  1009b3:	ff 74 24 10          	pushl  0x10(%esp)
  1009b7:	ff 74 24 10          	pushl  0x10(%esp)
  1009bb:	ff 74 24 10          	pushl  0x10(%esp)
  1009bf:	e8 47 fc ff ff       	call   10060b <console_vprintf>
  1009c4:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  1009c7:	c3                   	ret    
