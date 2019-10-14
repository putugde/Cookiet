#!/usr/bin/python

import random

food_scores = {'irish':[0.0,0.1],
			   'mexican':[0.95,1.00],
			   'chinese':[0.3,0.6],
			   'filipino':[0.50,0.70],
			   'vietnamese':[0.50,0.70],
			   'moroccan':[0.80,0.90],
			   'brazilian':[0.65,0.80],
			   'japanese':[0.40,0.60],
			   'british':[0.00,0.10],
			   'greek':[0.10,0.15],
			   'indian':[0.90,0.95],
			   'jamaican':[0.40,0.55],
			   'french':[0.05,0.10],
			   'spanish':[0.15,0.20],
			   'russian':[0.25,0.35],
			   'cajun_creole':[0.35,0.45],
			   'thai':[0.65,0.75],
			   'southern_us':[0.65,0.80],
			   'korean':[0.50,0.75],
			   'italian':[0.10,0.15]}

sauce = open('train.csv').read().split('\n')[1:-1]
print "number of lines in this train file", len(sauce)
# print "first line in this train file", sauce[0]
# print "last line in this train file", sauce[-1]
# print "last two line in this train file", sauce[-2]


#this function take a line of string as input
#and returns id (int) and type(string) for that line
def get_type(line):
	id_type = line.split('"')[0]
	return id_type.split(',')[1]

#this function take a line of string for argument
#and returns random score for the food in that line
def get_score(line):
	return random.uniform(food_scores[get_type(line)][0], food_scores[get_type(line)][1])

#this function take a line of string as argument
#and returns that line with additional 
def add_score(line):
	line = line.strip()
	result = line + ',' + str(get_score(line))
	return result

result_lines = ['id,cuisine,ingredients,score']

for line in sauce:
	result_lines.append(add_score(line))

result = '\n'.join(result_lines)

f = open('train_with_scores.csv','w+')
f.write(result)



# print get_score(sauce[0])
# print get_type(sauce[0])
# food_types = set()

# for line in sauce:
# 	food_types.add(get_type(line))

# print len(food_types)
# food_types = list(food_types)
# print food_types

# print add_score(sauce[1])
# print hex(ord(add_score(sauce[1])[-1]))
