# Two ways to load ron.txt in python

# First method
raw_moods = []
raw_genres = []

with  open('./data/ron.txt', 'r') as f:  # read in Ron's data
	for line in f.readlines():
		mood, genre = line.strip().split('\t')
		raw_moods.append(mood)
		raw_genres.append(genre)
	
# Second method
import numpy as np	
data = np.genfromtxt('./data/ron.txt', dtype=str, delimiter='\t')
moods = [x[0] for x in data]
genres = [x[1] for x in data]
