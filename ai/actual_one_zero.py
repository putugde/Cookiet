#!/usr/bin/python

actual_data = open('actual_data.csv').read().split('\n')[1:]
list_of_ingredients = open("ingredients.csv").read().split(',')
# this function take a line of string as input
# and returns score from that line
def get_score(line):
	raw = line.split(']')[-1]
	return raw.strip('",')

# print get_score(train_data[0]

# this function take a line of string as input
# and returns list of ingredients from that line
def get_ingredients(line):
	raw = line.split('[')[-1].split(']')[0]
	raw = raw.split(',')
	result = []
	
	for i in raw:
		result.append(i.strip("' "))
	
	return result
# this function take a line of string as input 
# and returns an array consist of one and zero and score for that line

def get_one_zero(line):
	temp = []
	ingredients = get_ingredients(line)

	for i in list_of_ingredients:
		if(i in ingredients):
			temp.append('1')
			ingredients.remove(i)
		else:
			temp.append('0')

	# count = 0
	# for i in temp:
	# 	if i == 1:
	# 		count += 1
	# print "number of ingredients", count 
	bits = ','.join(temp)
	score = get_score(line)
	result = bits + ',' + score
	return result

# print get_one_zero(train_data[0])
output = open('actual_one_zero.csv', 'w+')
lines = []

for line in actual_data:
	lines.append(get_one_zero(line))
text_content = open('ingredients.csv').read() + ',score\n'
text_content += '\n'.join(lines)
output.write(text_content)

