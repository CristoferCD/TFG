import time
from math import sqrt
from random import randint


class Worker(object):

    def __init__(self, id):
        self.id = id
        self.phObject = None
        self.var1 = None
        self.var2 = None
        self.solveValue = None

    def solve(self, scenario_name):
        print("")
        print("Requested solve for scenario " + scenario_name)

        valueArray = []
        for x in range(100000):
            tempValue = randint(0, self.var2)
            valueArray.append(sqrt((tempValue*self.var1)/self.var2))

        valueArray.sort()

        self.solveValue = sum(valueArray)
        self.print_vars()

        print("")
        print("Finished solve for scenario " + scenario_name +
              " with value: " + str(self.solveValue))

        return self.solveValue

    def print_vars(self):
        print("")
        print("Worker " + str(self.id) + " variables: ")
        print("\tVar 1: " + str(self.var1))
        print("\tVar 2: " + str(self.var2))

    def update_vars(self, n_var1, n_var2):
        if n_var1 < n_var2:
            self.var1 = n_var1
            self.var2 = n_var2
        else:
            self.var2 = n_var1
            self.var1 = n_var2
