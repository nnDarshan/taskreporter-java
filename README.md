# taskreporter-java
taskreporter library for java code using AspectJ

# Steps to run
1. install AspectJ:
   please refer "Installing AspectJ Compiler" section of http://www.cs.utep.edu/cheon/cs3360/project/proj2/installing-aspectj.txt to install aspectJ on your machine

2. Install Junit on your machine

4. cd to the source directory.

3. Run following command to compile the test code with AspectJ:

      `ajc -d bin -1.5 -cp .:<junit.jar path>:<aspectjrt.jar path>  src/org/hwx/junitAOP/*.java src/org/hwx/junitAOP/TaskReporter.aj`
         
4. cd to the bin directory.

5. Run the following command to run the test code:

      `java -cp .:<junit.jar path>:<hamcrest-core-1.3.jar path>:<aspectjrt.jar path>  org.hwx.junitAOP.TestRunner`
