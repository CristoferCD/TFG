#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# FARMER

echo "Creating baseline for Farmer"
cd ../../../pyomo/examples/pysp/farmer

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Farmer baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerSeq.ph_solution.json

echo "Executing Farmer with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerPHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Farmer execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerPHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFarmerPHSpark.ph_solution.json TestFarmerSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}Farmer test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}Farmer test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# BAA99

echo "Creating baseline for baa99"
cd ../../../pyomo/examples/pysp/baa99

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=ReferenceModel.py --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestBaa99Seq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Baa99 baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestBaa99Seq.ph_solution.json

echo "Executing Baa99 with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=ReferenceModel.py --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestBaa99PHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Baa99 execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestBaa99PHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestBaa99Seq.ph_solution.json TestBaa99PHSpark.ph_solution.json)

if [ $? -eq 0 ]
then
        printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}Baa99 test passed${NC}\n"
        printf "${GREEN}------------------${NC}\n"
else
        printf "${RED}------------------${NC}\n"
        printf "${RED}Baa99 test failed${NC}\n"
        printf "$result\n"
        printf "${RED}------------------${NC}\n"
fi

# FARMER_GENERATED

echo "Creating baseline for Farmer_generated"
cd ../../../pyomo/examples/pysp/farmer_generated

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=model.py --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmer_generatedSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Farmer_generated baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmer_generatedSeq.ph_solution.json

echo "Executing Farmer_generated with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=model.py --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmer_generatedPHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Farmer_generated execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmer_generatedPHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFarmer_generatedPHSpark.ph_solution.json TestFarmer_generatedSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}Farmer_generated test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}Farmer_generated test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# FARMERWINTEGERS

echo "Creating baseline for FarmerWIntegers"
cd ../../../pyomo/examples/pysp/farmerWIntegers

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWIntegersSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWIntegers baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWIntegersSeq.ph_solution.json

echo "Executing FarmerWIntegers with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWIntegersPHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWIntegers execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWIntegersPHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFarmerWIntegersPHSpark.ph_solution.json TestFarmerWIntegersSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}FarmerWIntegers test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}FarmerWIntegers test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# FARMERWPIECEWISE

echo "Creating baseline for FarmerWpiecewise"
cd ../../../pyomo/examples/pysp/farmerWpiecewise

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=nodedata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWpiecewiseSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWpiecewise baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWpiecewiseSeq.ph_solution.json

echo "Executing FarmerWpiecewise with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=nodedata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWpiecewisePHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWpiecewise execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWpiecewisePHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFarmerWpiecewisePHSpark.ph_solution.json TestFarmerWpiecewiseSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}FarmerWpiecewise test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}FarmerWpiecewise test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# FARMERWrent

echo "Creating baseline for FarmerWrent"
cd ../../../pyomo/examples/pysp/farmerWrent

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=nodedata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWrentSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWrent baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWrentSeq.ph_solution.json

echo "Executing FarmerWrent with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=nodedata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWrentPHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "FarmerWrent execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFarmerWrentPHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFarmerWrentPHSpark.ph_solution.json TestFarmerWrentSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}FarmerWrent test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}FarmerWrent test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# FINANCE

echo "Creating baseline for Finance"
cd ../../../pyomo/examples/pysp/finance

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFinanceSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Finance baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFinanceSeq.ph_solution.json

echo "Executing Finance with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFinancePHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Finance execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestFinancePHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestFinancePHSpark.ph_solution.json TestFinanceSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}Finance test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}Finance test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi

# HYDRO

echo "Creating baseline for Hydro"
cd ../../../pyomo/examples/pysp/hydro

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=serial --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestHydroSeq.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Hydro baseline creation time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestHydroSeq.ph_solution.json

echo "Executing Hydro with Spark"

start=`date +%s.%N`

PHHISTORYEXTENSION_USE_JSON=1 runph -r 1 --solver-manager=phspark --traceback --solver=minos --solver-io=nl --xhat-method=voting --traceback --model-directory=models/ReferenceModel.py --instance-directory=scenariodata/ScenarioStructure.dat --user-defined-extension=pyomo.pysp.plugins.phhistoryextension --solution-writer=pyomo.pysp.plugins.jsonsolutionwriter &> ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestHydroPHSpark.out

end=`date +%s.%N`
diff=$(echo "$end - $start" | bc)
echo "Hydro execution time: $diff"

mv ph_solution.json ../../../../Documentación/Pruebas/Salidas\ ejemplos/TestHydroPHSpark.ph_solution.json

cd ../../../../Documentación/Pruebas/Salidas\ ejemplos

result=$(colordiff -y TestHydroPHSpark.ph_solution.json TestHydroSeq.ph_solution.json)

if [ $? -eq 0 ]
then
	printf "${GREEN}------------------${NC}\n"
        printf "${GREEN}Hydro test passed${NC}\n"
	printf "${GREEN}------------------${NC}\n"
else
	printf "${RED}------------------${NC}\n"
        printf "${RED}Hydro test failed${NC}\n"
        printf "$result\n"
	printf "${RED}------------------${NC}\n"
fi