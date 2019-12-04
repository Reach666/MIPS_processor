filename = 'mips3_4.txt'
gen_file = 'mips3_5.txt'
row_num = -1
f = open(filename,'r')
f1 = open(gen_file,'w')
ins = f.readlines()
for i in ins:
    if '0' in i or '1' in i:
        row_num += 1
        PC = row_num * 4
        i_noblank = i.replace(' ','')
        f1.write(i_noblank[0:-1]+'//'+hex(PC)+'\n')

f1.close()
