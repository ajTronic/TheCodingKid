# read file
# loop through file
# declare tape
# declare pointer
# match for >,
# match for -+
# match for .
# match for []

file = open('script.bf')
script = file.read()
file.close()

tape = [0] * 30000
ptr = 0
pc = 0

while pc < len(script):
    match script[pc]:
        case '>': ptr += 1
        case '<': ptr -= 1
        case '+': tape[ptr] = (tape[ptr] + 1) % 256
        case '-': tape[ptr] = (tape[ptr] - 1) % 256
        case ',': tape[ptr] = ord(input()[0])
        case '.': print(chr(tape[ptr]), end='')
        case '[': 
            if tape[ptr] == 0:
                depth = 1
                while depth != 0:
                    pc += 1
                    if script[pc] == '[': depth += 1
                    if script[pc] == ']': depth -= 1
        case ']': 
            if tape[ptr] != 0:
                depth = 1
                while depth != 0:
                    pc -= 1
                    if script[pc] == ']': depth += 1
                    if script[pc] == '[': depth -= 1
    pc += 1