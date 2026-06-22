format PE64 CONSOLE
entry start
include 'win64a.inc'
section '.data' data readable writeable
num_fmt db '%d',0
var_2 db '2000',13,10
var_2_len = $ - var_2
written_2 dq 0
dllarg_4_1 db 'Hi',0
dllarg_4_2 db 'T',0
section '.code' code readable executable
start:
    and rsp, -16
    invoke SetConsoleOutputCP, 65001
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    mov rbx, rax
    invoke GetStdHandle, STD_INPUT_HANDLE
    mov rsi, rax
    invoke WriteFile, rbx, var_2, var_2_len, written_2, 0
    invoke Sleep, 2000
    invoke MessageBoxA, 0, dllarg_4_1, dllarg_4_2, 0
    invoke ExitProcess, 0
section '.idata' import data readable writeable
library kernel32, 'KERNEL32.DLL', msvcrt, 'msvcrt.dll', user32, 'user32.dll'
import kernel32, GetStdHandle, 'GetStdHandle', WriteFile, 'WriteFile', ReadConsoleA, 'ReadConsoleA', SetConsoleOutputCP, 'SetConsoleOutputCP', ExitProcess, 'ExitProcess', WaitForSingleObject, 'WaitForSingleObject', CloseHandle, 'CloseHandle', Sleep, 'Sleep'
import msvcrt, crt_sscanf, 'sscanf', crt_sprintf, 'sprintf', crt_strlen, 'strlen', crt_system, 'system'
import user32, MessageBoxA, 'MessageBoxA'
