import re

f = open('answers.txt', 'r');

lines = []
for line in f:
    lines.append(re.split("\D+", line))

#Get rid of empty lines
for i in xrange(len(lines)):
    lines[i] = filter(lambda x : x != '', lines[i])


input_file = open('input.txt', 'w')
answer_file = open('solution.txt', 'w')

#the correct answer is the last answer, so write it the answer file
for i in xrange(len(lines)):
    answer_file.write(lines[i].pop())
    if i < len(lines) - 1:
        answer_file.write('\n')

answer_file.close()

#write each test case to a file on its own line
for i in xrange(len(lines)):
    for num in lines[i]:
        input_file.write(num + ' ')
    if i < len(lines) - 1:
        input_file.write('\n')


input_file.close()
