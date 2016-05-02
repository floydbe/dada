Examples for Buffer overflow attacks

Instructions:
1. To compile, in the directory of each example, run ($ is the command prompt symbol)
   $ bash compile.sh

2. To generate attack string file, in the directory of each example, run the gen_input_*.sh file
   $ bash gen_input_*.sh

3. To test the attack, in the directory of each example, first start an bash without ASRL by running
   $ setarch i386 -RL /bin/bash

   Then start the program with empty environment variables, and redirect stdin from attack string file 
   $ env - example_executable < input.txt

For example, for check_passwd2, do the following to compile, generate and test the attack:
in the check_passwd2/ directory
$ bash compile.sh
$ bash gen_input_ubuntu1204.sh
$ setarch i386 -RL /bin/bash
$ env - check_passwd2 < input.txt

Note, only tested on 32-bit Ubuntu 14.04.3
  
  
   
	
