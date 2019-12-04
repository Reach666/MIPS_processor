###editor: cmh
###fuction: change assembly instruction into machine instruction
###支持的指令有addi,add,slt,lw,sw,beq,j
###支持所有所有zero,t,s寄存器
###支持0-15的正负立即数
###Label不要和指令放在同一行
###将此文件和mips.txt放在同一目录下

source_file='mips3_3.txt'  #源汇编代码文件名
dir_file='mips3_4.txt'     #产生的目标文件名
code = 'utf-8'           #需要在此输入源汇编代码文件的编码方式
rt = 'rt '

f=open(source_file,encoding=code)
ins = f.readlines()
f1=open(dir_file,'w')

def w_op(i,index_n):
    global op
    if 'addi' in i[0:index_n]:
        op = '001000 '
    if 'beq' in i[0:index_n]:
        op = '000100 '
    if 'add' in i[0:index_n] and \
       'addi' not in i[0:index_n]:
        op = '000000 '
    if 'lw' in i[0:index_n]:
        op = '100011 '
    if 'j' in i[0:index_n]:
        op = '000010 '
    if 'slt' in i[0:index_n]:
        op = '000000 '
    if 'sw' in i[0:index_n]:
        op = '101011 '
    return op

def w_func(i,fir_comma):
    global func
    if 'add' in i[0:fir_comma] and \
       'addi' not in i[0:fir_comma]:
        func = '100000\n'
    if 'slt' in i[0:fir_comma]:
        func = '101010\n'
    return func

def w_rs(i,fir_comma,sec_comma):
    global rs
    if 'zero' in i[fir_comma:sec_comma]:
        rs = '00000 '
    if 't0' in i[fir_comma:sec_comma]:
        rs = '01000 '
    if 't1' in i[fir_comma:sec_comma]:
        rs = '01001 '
    if 't2' in i[fir_comma:sec_comma]:
        rs = '01010 '
    if 't3' in i[fir_comma:sec_comma]:
        rs = '01011 '
    if 't4' in i[fir_comma:sec_comma]:
        rs = '01100 '
    if 't5' in i[fir_comma:sec_comma]:
        rs = '01101 '
    if 't6' in i[fir_comma:sec_comma]:
        rs = '01110 '
    if 't7' in i[fir_comma:sec_comma]:
        rs = '01111 '
    if 's0' in i[fir_comma:sec_comma]:
        rs = '10000 '
    if 's1' in i[fir_comma:sec_comma]:
        rs = '10001 '
    if 's2' in i[fir_comma:sec_comma]:
        rs = '10010 '
    if 's3' in i[fir_comma:sec_comma]:
        rs = '10011 '
    if 's4' in i[fir_comma:sec_comma]:
        rs = '10100 '
    if 's5' in i[fir_comma:sec_comma]:
        rs = '10101 '
    if 's6' in i[fir_comma:sec_comma]:
        rs = '10110 '
    if 's7' in i[fir_comma:sec_comma]:
        rs = '10111 '
    if 't8' in i[fir_comma:sec_comma]:
        rs = '11000 '
    if 't9' in i[fir_comma:sec_comma]:
        rs = '11001 '
    return rs

def w_rd(i,fir_comma):
    global rd
    if 'zero' in i[0:fir_comma]:
        rd = '00000 '
    if 't0' in i[0:fir_comma]:
        rd = '01000 '
    if 't1' in i[0:fir_comma]:
        rd = '01001 '
    if 't2' in i[0:fir_comma]:
        rd = '01010 '
    if 't3' in i[0:fir_comma]:
        rd = '01011 '
    if 't4' in i[0:fir_comma]:
        rd = '01100 '
    if 't5' in i[0:fir_comma]:
        rd = '01101 '
    if 't6' in i[0:fir_comma]:
        rd = '01110 '
    if 't7' in i[0:fir_comma]:
        rd = '01111 '
    if 's0' in i[0:fir_comma]:
        rd = '10000 '
    if 's1' in i[0:fir_comma]:
        rd = '10001 '
    if 's2' in i[0:fir_comma]:
        rd = '10010 '
    if 's3' in i[0:fir_comma]:
        rd = '10011 '
    if 's4' in i[0:fir_comma]:
        rd = '10100 '
    if 's5' in i[0:fir_comma]:
        rd = '10101 '
    if 's6' in i[0:fir_comma]:
        rd = '10110 '
    if 's7' in i[0:fir_comma]:
        rd = '10111 '
    if 't8' in i[0:fir_comma]:
        rd = '11000 '
    if 't9' in i[0:fir_comma]:
        rd = '11001 '
    return rd

def w_rt(i,sec_comma,index_n):
    global rt
    if 'zero' in i[sec_comma:index_n]:
        rt = '00000 '
    if 't0' in i[sec_comma:index_n]:
        rt = '01000 '
    if 't1' in i[sec_comma:index_n]:
        rt = '01001 '
    if 't2' in i[sec_comma:index_n]:
        rt = '01010 '
    if 't3' in i[sec_comma:index_n]:
        rt = '01011 '
    if 't4' in i[sec_comma:index_n]:
        rt = '01100 '
    if 't5' in i[sec_comma:index_n]:
        rt = '01101 '
    if 't6' in i[sec_comma:index_n]:
        rt = '01110 '
    if 't7' in i[sec_comma:index_n]:
        rt = '01111 '
    if 's0' in i[sec_comma:index_n]:
        rt = '10000 '
    if 's1' in i[sec_comma:index_n]:
        rt = '10001 '
    if 's2' in i[sec_comma:index_n]:
        rt = '10010 '
    if 's3' in i[sec_comma:index_n]:
        rt = '10011 '
    if 's4' in i[sec_comma:index_n]:
        rt = '10100 '
    if 's5' in i[sec_comma:index_n]:
        rt = '10101 '
    if 's6' in i[sec_comma:index_n]:
        rt = '10110 '
    if 's7' in i[sec_comma:index_n]:
        rt = '10111 '
    if 't8' in i[sec_comma:index_n]:
        rt = '11000 '
    if 't9' in i[sec_comma:index_n]:
        rt = '11001 '
    return rt

def w_imm(i,sec_comma,index_n):
    global imm
    if '0' in i[sec_comma:index_n]:
        imm = '0000000000000000\n'
    if '1' in i[sec_comma:index_n]:
        imm = '0000000000000001\n'
    if '2' in i[sec_comma:index_n]:
        imm = '0000000000000010\n'
    if '3' in i[sec_comma:index_n]:
        imm = '0000000000000011\n'
    if '4' in i[sec_comma:index_n]:
        imm = '0000000000000100\n'
    if '5' in i[sec_comma:index_n]:
        imm = '0000000000000101\n'
    if '6' in i[sec_comma:index_n]:
        imm = '0000000000000110\n'
    if '7' in i[sec_comma:index_n]:
        imm = '0000000000000111\n'
    if '8' in i[sec_comma:index_n]:
        imm = '0000000000001000\n'
    if '9' in i[sec_comma:index_n]:
        imm = '0000000000001001\n'
    if '10' in i[sec_comma:index_n]:
        imm = '0000000000001010\n'
    if '11' in i[sec_comma:index_n]:
        imm = '0000000000001011\n'
    if '12' in i[sec_comma:index_n]:
        imm = '0000000000001100\n'
    if '13' in i[sec_comma:index_n]:
        imm = '0000000000001101\n'
    if '14' in i[sec_comma:index_n]:
        imm = '0000000000001110\n'
    if '15' in i[sec_comma:index_n]:
        imm = '0000000000001111\n'
    if '-' in i[sec_comma:index_n]:
        imm = '1'+imm[1:]
    if 'exitmod2' in i[sec_comma:index_n]:
        imm = 'xxxxxxxxxxxxxxxx   //exitmod2_addr\n'
    if 'exitmod3' in i[sec_comma:index_n]:
        imm = 'xxxxxxxxxxxxxxxx   //exitmod3_addr\n'
    if 'exitmod4' in i[sec_comma:index_n]:
        imm = 'xxxxxxxxxxxxxxxx   //exitmod4_addr\n'
    if 'Exit' in i[sec_comma:index_n]:
        imm = 'xxxxxxxxxxxxxxxx   //Exit_addr\n'
    if 'exitmod' in i[sec_comma:index_n] and \
       'exitmod2' not in i[sec_comma:index_n] and \
       'exitmod3' not in i[sec_comma:index_n] and \
       'exitmod4' not in i[sec_comma:index_n]:
        imm = 'xxxxxxxxxxxxxxxx   //exitmod_addr\n'
    return imm
        
for i in ins:
    if i == '\n':
        f1.write('\n')
    else:
        fir_comma = i.find(',')
        sec_comma = i.find(',',fir_comma+1)
        if ';' in i:
            index_n = i.find(';')
        else:    
            index_n = i.find('\n')
        if ':' in i:
            f1.write(i[0:index_n]+'\n')
        else:
            op = w_op(i,index_n)
            rs = w_rs(i,fir_comma,sec_comma)
            rd = w_rd(i,fir_comma)
            rt = w_rt(i,sec_comma,index_n)
            imm = w_imm(i,sec_comma,index_n)
            f1.write(op)
            if 'j' not in i[0:index_n]:
                if op == '000000 ':
                    f1.write(rs)
                    f1.write(rt)
                    f1.write(rd)
                    f1.write('00000 ')
                    func = w_func(i,fir_comma)
                    f1.write(func)
                elif op == '100011 ' or op == '101011 ':
                    #f1.write('01001 01000 0000000000000000\n')
                    index_brac = i.find('(')
                    rs = w_rs(i,index_brac,index_n)
                    rd = w_rd(i,fir_comma)
                    imm = w_imm(i,fir_comma,index_brac)
                    f1.write(rs)
                    f1.write(rd)
                    f1.write(imm)
                else:
                    f1.write(rs)
                    f1.write(rd)
                    f1.write(imm)
            elif 'j' in i[0:index_n]:
                if 'f' in i[0:index_n]:
                    f1.write('xxxxxxxxxxxxxxxxxxxxxxxxxx   //forloop_addr\n')
                elif 'F' in i[0:index_n]:
                    f1.write('xxxxxxxxxxxxxxxxxxxxxxxxxx   //Forloop_addr\n')
                else:
                    f1.write('xxxxxxxxxxxxxxxxxxxxxxxxxx   //???_addr\n')
f1.close()


