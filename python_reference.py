#!/usr/bin/env python3

import argparse
import os
import re
import sys

# you can import under an alias. the aliases here are widely used conventions
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np


# you can import a specific function from a module
import math
from math import sqrt

def do_math():
	two = sqrt(4)				# imported individually from math
	three = math.factorial(2)

"""PEP 8

PEP 8 is the universaly accepted Style Guide for Python Code.
https://www.python.org/dev/peps/pep-0008/


Adhere to it if you want your code to look like Python to other Python programmers.
"""

def main(text, reps):
	""" Google Style Python Docstrings

	Utilities like sphinx can parse docstrings like this and turn them into nicely
	formatted .pdf, .html and other files. Different formats are common, and parsable
	by sphinx. Check the 'normal' Sphinx style docstrings and the NumPy style docstrings
	for more info.

	Args:
        reps (int): Number of times text should be printed.
        text (str): Text to be printed.

	Returns:
		tuple: parameters given as input.

	Examples:
		Simple test can be done with the 'Doctest' library.  Added benefit is that other
		programmers have an idea wath to expect from your code.

		>>> main(1, "Hello, world!")
		(1, "Hello, world!")
	"""

	# hopefully these function names are usable as table of content.
	# empty_function_without_error()
	# print_to_stdout(text, reps)
	# make_a_dictionary()
	# slice_a_list()
	# format_a_string()
	# use_comprehensions()
	# read_and_write_a_file()
	# make_a_class()
	# parse_with_biopython()
	do_regex()
	# use_numpy_arrays()
	# make_a_matplotlib_figure()
	# load_image_as_nulpy_matrix()

	return(text, reps)


def empty_function_without_error():
    """ empty function"""
    pass	# without 'pass' an empty function gives an error. usefull as placeholder.


def print_to_stdout(text, reps):
	""" Print text to stdout x times."""
	for i in range(reps): # use: range(size), range(begin, end) or range(begin, end, step_size)
		print(text)


def make_a_dictionary():
	""" use dictcomprehesions for bigger/more complex dictionaries.
	see: use_comprehensions()
	"""

	# Either use curly brackets...
	a_dict = {1:"You do not talk about FIGHT CLUB.",
			  2:"You do not talk about FIGHT CLUB.",
			  6:"No shirts, no shoes."}

	# ...or use the dict() function with parameters...
	b_dict = dict(fruit=["apple", "orange"],
				  vegetable=["courgette"])

	# ...or give a list with tuples as input.
	c_dict = dict([("fruit", ["apple", "orange"]),
				   ("vegetable", ["courgette"]  )])


	# print dicts using .values(), .keys() or .items()
	for val in a_dict.values():
		print(val)

	for key in b_dict.keys():
		print(key, b_dict[key])

	for key, val in c_dict.items():
		print(key, val)

def slice_a_list():
	string = "World!Hello"

	a_list = [string[6:],				# slice strings by index
			  "W" + string[1:5]]		# string + string = string
	a_list = a_list + [string[5]*3]		# list + list = list
	a_list += [1]						# you can mix ints and strings in one list.

	# join list entries in one string (but convert ints to string if necessary)
	new_string = " ".join([str(i) for i in a_list])
	print(new_string)

def format_a_string():
	"""Use .format to format strings

	{<index>:<options>}

	Examples:
		>>> print("{0} {0} {1} {2:06.2f} {2:6.2f} {2:.2f} {2:2f}".format(1, 1+1, 4.0/3.0))
		'1 1 2   1.33 001.33   1.33 1.33 1.333333'
	"""
	auto_formatted = "{} {} {}".format(1, 1+1, 4.0/3.0)
	formatted_with_options = "{0} {0} {1} {2: 6.2f} {2:06.2f} {2:6.2f} {2:.2f} {2:2f}".format(1, 1+1, 4.0/3.0)
	print(auto_formatted, formatted_with_options)


def use_comprehensions():
	# the dict comprehension way
	integer_list = range(10)
	binary_list = [ bin(i) for i in integer_list ]			# use functions within the comprehension
	zipped_list = zip(integer_list, binary_list )			# zip two lists together (or unzip using list(zip(*zipped_list)) )
	big_dict = {key: value for key, value in zipped_list }

	# the "look at me" all in one line way
	oneliner_dict = {key: value for key, value in zip(range(10), [bin(i) for i in integer_list])}

	print(big_dict == oneliner_dict) # true. meaning "==" checks for content not object id.

def read_and_write_a_file():
	""" opening, reading and writing files.

	The 'with ... as ...' keywords are context managers. They are basicly a shorthand for
	predefined "try, catch, finaly" statements. In case of open() they close they your file
	for you.
	"""
	cwd = os.getcwd()
	file1 = os.path.join(cwd, "file1.txt")
	file2 = os.path.join(cwd, "file2.txt")

	with open(file1, "a+") as file:	# a+ reads and appends to a file.
		first_line = file.readline()
		second_line = file.readline()

	with open(file1, "r") as f1, open(file1, "w") as f2: # opens two files at once. r = read mode, w = (over)write mode
		for line in f1.readlines():
			f2.write(line)


class MyClass:
	def __init__(self, a, b):
		self.a = a
		self.b = b
		self.my_method()

	def my_method(self):
		self.c = self.a + self.b


class MySubClass(MyClass):
	def __init__(self, a, b, d):
		if sys.version_info[0] < 3:			# Check for python version. In case your university pc's are outdated...
			MyClass.__init__(self, a, b)	# python 2
		else:
			super().__init__(a, b)			# python 3
		self.d = d


def make_a_class():
	my_class = MySubClass(1, 2, 4)
	print(my_class.a,
		  my_class.b,
		  my_class.c,
		  my_class.d)


def parse_with_biopython():
	"""read the docs :)

	https://biopython.org/DIST/docs/api/Bio.SeqIO-module.html
	"""
	# biopython is not available on (all) ku leuven pc's. Therefor not part of exam?
	### from Bio import SeqIO # Bio[!] not Biopython


def do_regex():
	""" Use functions like .startswith()/.strip()/.split() instead of regex if you
	can. Its faster and easier.
	"""
	fasta_file = """>gi|1348917|gb|G26685|G26685 human STS STS_D11734.
	CGGAGCCAGCGAGCATATGCTGCATGAGGACCTTTCTATCTTACATTATGGCTGGGAATCTTACTCTTTC
	ATCTGATACCTTGTTCAGATTTCAAAATAGTTGTAGCCTTATCCTGGTTTTACAGATGTGAAACTTTCAA
	GAGATTTACTGACTTTCCTAGAATAGTTTCTCTACTGGAAACCTGATGCTTTTATAAGCCATTGTGATTA
	GGATGACTGTTACAGGCTTAGCTTTGTGTGAAANCCAGTCACCTTTCTCCTAGGTAATGAGTAGTGCTGT
	TCATATTACTNTAAGTTCTATAGCATACTTGCNATCCTTTANCCATGCTTATCATANGTACCATTTGAGG
	AATTGNTTTGCCCTTTTGGGTTTNTTNTTGGTAAANNNTTCCCGGGCCCTGGGGGNGGTNNNGAAA
	>gi|1348917|gb|G26685|G26685 human STS STS_D11734..
	CGGAGCCAGCGAGCATATGCTGCATGAGGACCTTTCTATCTTACATTATGGCTGGGAATC
	TTACTCTTTCATCTGATACCTTGTTCAGATTTCAAAATAGTTGTAGCCTTATCCTGGTTT
	TACAGATGTGAAACTTTCAAGAGATTTACTGACTTTCCTAGAATAGTTTCTCTACTGGAA
	ACCTGATGCTTTTATAAGCCATTGTGATTAGGATGACTGTTACAGGCTTAGCTTTGTGTG
	AAANCCAGTCACCTTTCTCCTAGGTAATGAGTAGTGCTGTTCATATTACTNTAAGTTCTA
	TAGCATACTTGCNATCCTTTANCCATGCTTATCATANGTACCATTTGAGGAATTGNTTTG
	CCCTTTTGGGTTTNTTNTTGGTAAANNNTTCCCGGGCCCTGGGGGNGGTNNNGAAA
	"""

	# parse fasta into dictionary (no regex needed)
	lines = fasta_file.split("\n")
	fasta_dict = {}
	current_seq = ""
	for line in lines:
		line = line.strip()
		if line.startswith(">"):
			current_seq = line
			fasta_dict[current_seq] = ""
		else:
			fasta_dict[current_seq] += line
	for k, v in fasta_dict.items():
		print(k, v, sep="\n")

	# make a pattern you want matched
	longest = re.compile(r"(CCC|GGG){2,}") 		# greedy
	shortest = re.compile(r"(CCC|GGG){2,}?") 	# lazy

	#
	gc = re.compile(r"[GC]*")

	# look behind (?<=...) and look forward (?=...) functions are necessary for a hit
	# but not included in the final pattern
	flanked = re.compile(r"(?<=[AT]{2})N+(?=[AT]{2})")

	for seq in fasta_dict.values():
		print(longest.search(seq).group())
		print(shortest.search(seq).group())

		# all matches
		all_sub_seqs = gc.findall(seq)

		# find longest
		max_size = max(len(s) for s in all_sub_seqs)
		print([s for s in all_sub_seqs if len(s) == max_size])

		# sybstitute pattern with string
		print(flanked.sub("......", seq))




def use_numpy_arrays():
	A = np.array([[1, 2, 3],
			  [4, 5, 6],
			  [7, 8, 9]],
			  dtype=float)
	b = np.arange(9.0)
	B = np.reshape(b, (3, 3))
	C = np.full((3, 3), 3)

	# do some linear algebra
	print(A.dot(B))
	print(np.transpose(A))
	print(np.linalg.inv(A))
	print(np.linalg.svd(A))


def make_a_matplotlib_figure():
	#---------------------------------------------------------------------------
	mu = 2
	sigma =  0.5
	v = np.random.normal(mu,sigma,10000)
	plt.hist(v, bins=50)
	plt.show()
	#---------------------------------------------------------------------------
	x = np.linspace(0, 2, 100) # Return evenly spaced numbers over a specified interval.
	plt.plot(x, x, label='linear')
	plt.plot(x, x**2, label='quadratic')
	plt.plot(x, x**3, label='cubic')
	plt.xlabel('x label')
	plt.ylabel('y label')
	plt.title("Simple Plot")
	plt.legend()
	plt.show()
	#---------------------------------------------------------------------------
	np.random.seed(19680801)
	data = np.random.randn(2, 100)

	# it not very 'pythonic' but you can assign two variables at once.
	# matplotlib kinda forces you here.
	fig, axs = plt.subplots(2,2,figsize=(5,5))

	axs[0,0].hist(data[0])
	axs[1,0].scatter(data[0], data[1])
	axs[0,1].plot(data[0], data[1])
	axs[1,1].hist2d(data[0], data[1])
	plt.show()


def load_image_as_nulpy_matrix():
	""" PIL - Python Image Library

	is not part of the Standard Library and not installed by default at KU Leuven pc's
	"""
	pass


def parseArgs():
	""" Parses arguments from commandline using the 'argparse' module.

	The argparse module is part of the Python standard library, meaning that it is
	included in all python installations.

	Examples:
		python .\test.py 'Hello, world' -r 2

		>>> Hello, world
		>>> Hello, world

		python .\test.py 'Hello, world'

		>>> Hello, world

		python .\test.py -h

		>>> usage: test.py [-h] [-r [REPS]] text
		>>>
		>>> positional arguments:
		>>>   text
		>>>
		>>> optional arguments:
		>>>	  -h, --help            show this help message and exit
		>>>   -r [REPS], --reps [REPS]
		>>>   						specify number of times text should be printed
	"""
	parser = argparse.ArgumentParser()
	# simple positional argument
	# parser.add_argument('text') 									# required by default
	parser.add_argument('-t', '--text') 							# required by default
	# more complex keyword argument
	parser.add_argument('-r', '--reps', type=int, required=False, 	# '-' and '--' indicate flags
		nargs='?', 													# nargs='?' means 0-1 arguments possible
		const=1, 													# const=<...> gives a default value
		help="specify number of times text should be printed")		# help text available from the commandline

	args = parser.parse_args()
	if args.reps is None or args.text is None:
		return("text here", 1)
	else:
		return(args.text, args.reps)

""" triggers if this scripts '__name__' is that of the '__main__' program.
In other words: This only triggers if the script is run directly and not by another
script.
"""
if __name__ == "__main__":
	main(*parseArgs())												# *<some iterable> unpacks a iterable
