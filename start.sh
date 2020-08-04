#!/bin/bash

echo ''
echo 'Please select the type of execution that you would like to run:'
echo '1. Interactive (Input required)'
echo '2. Non-Interactive (No onput required)'
read -p 'Please select, and press Enter (or press Ctrl+c to exit): ' userSelection

echo 'Please select training data size that you would like to use:'
echo '1. 124M'
echo '2. 355M'
echo '3. 774M'
echo '4. 1558M'
read -p 'Please select, and press Enter (or press Ctrl+c to exit): ' modelSizeSelect

if [ $modelSizeSelect -eq '1' ]; then
    echo 'Model Size: 124M'
    modelSize="124M"
elif [ $modelSizeSelect -eq '2' ]; then
    echo 'Model Size: 355M'
    modelSize="355M"
elif [ $modelSizeSelect -eq '3' ]; then
    echo 'Model Size: 774M'
    modelSize="774M"
elif [ $modelSizeSelect -eq '4' ]; then
    echo 'Model Size: 1558M'
    modelSize="1558M"
else
    echo 'No option was selected, using default size is (124M)...'
    modelSize="124M"
fi

if [ $userSelection -eq '1' ]; then
    echo 'Executing Interactive Mode'
    python3 src/interactive_conditional_samples.py --model_name=$modelSize;
    exit 0
elif [ $userSelection -eq '2' ]; then
    echo 'Executing Non-Interactive Mode'
    python3 src/generate_unconditional_samples.py --model_name=$modelSize;
    exit 0
else
    echo 'No option was selected...'
fi

exit 1
