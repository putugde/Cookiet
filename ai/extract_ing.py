#!/usr/bin/python

sauce  = open("train_with_scores.csv").read().split('\n')[1:]
# print sauce[0]
# print sauce[-1]

# this function take a line of string as input
# and returns list of ingredients from that line
def get_ingredients(line):
	raw = line.split('[')[-1].split(']')[0]
	raw = raw.split(',')
	result = []
	
	for i in raw:
		result.append(i.strip("' "))
	
	return result
	# for i in raw:
	# 	print i

set_of_ingredients = set()

for line in sauce:
	temp = get_ingredients(line)
	for i in temp:
		set_of_ingredients.add(i)

print "number of ingredients", len(set_of_ingredients)
# for ingredients in list_of_ingredients:
# 	print ingredients
output = open('ingredients.csv','w+')

temp_list_of_ing = list(set_of_ingredients)[1:]
# print temp_list_of_ing[0]	
# print len(temp_list_of_ing[0])
ing_text = ','.join(temp_list_of_ing)
output.write(ing_text)




# empty_count = 0
# for i in temp_list_of_ing:
# 	if len(i) == 0:
# 		empty_count += 1

# print "empty_count :", empty_count