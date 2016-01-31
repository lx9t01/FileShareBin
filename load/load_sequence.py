# One way to load sequenceprediction1.txt in python

seq = 1
filename =  './data/sequenceprediction' + str(seq+1) + '.txt'
A = []  # transition matrix
O = []  # observation matrix
sequences = []
num_seq = 5

with open(filename, 'r') as f:
	num_states, num_obs = [int(x) for x in f.readline().strip().split('\t')]
	for i in range(num_states):
		A.append([float(x) for x in f.readline().strip().split('\t')])
	for i in range(num_states):
		O.append([float(x) for x in f.readline().strip().split('\t')])
	for i in range(num_seq):
		sequences.append([int(x) for x in list(f.readline().strip())])
f.close()

print A
print O
print sequences
