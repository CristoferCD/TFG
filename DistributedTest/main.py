import time
from random import randint

from pyspark import SparkConf, SparkContext

from Worker import Worker


def do_iteration(worker, scenario_name, var1, var2):
    worker.update_vars(var1.value, var2.value)
    worker.solve(scenario_name)


if __name__ == "__main__":

    startTime = time.time()

    conf = SparkConf().setMaster("local").setAppName("Test")
    #conf = SparkConf().setMaster("spark://localhost:7077").setAppName("Test")

    sc = SparkContext(conf=conf, pyFiles=["/home/crist/PycharmProjects/DistributedTest/dependencies.zip"])

    scenarioSize = 20

    workerList = []
    scenarioList = []
    for i in range(scenarioSize):
        workerList.append(Worker(i))
        scenarioList.append("Scenario " + str(i))

    parallelWorkerList = sc.parallelize(zip(workerList, scenarioList)).persist()

    for x in range(20):
        var1 = randint(100, 10000)
        var2 = randint(100, 10000)
        print("Initializing iteration " + str(x))

        print("Updating variables: ")
        print("\tvar1: " + str(var1))
        print("\tvar2: " + str(var2))

        broadcast1 = sc.broadcast(var1)
        broadcast2 = sc.broadcast(var2)

        solved_values = parallelWorkerList.foreach(lambda item: do_iteration(item[0], item[1], broadcast1, broadcast2)).collect()

        #solved_values = parallelWorkerList.map(lambda item: do_iteration(item[0], item[1], broadcast1, broadcast2)).collect()

        assert len(solved_values) == scenarioSize

    print("Total time: " + str(time.time() - startTime))
