package org.hwx.junitAOP;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import java.io.StringWriter;
import java.io.PrintWriter;


//public aspect TaskReporter {
//
//   pointcut function():
//	   call(int org.hwx.aop.AopExample.testOne(..));
//   
//   after(): function(){
//	   System.out.println("After section of aspect");
//   }
//}

//@Aspect
//public class TaskReporter {
// 
//    //Defines a pointcut that we can use in the @Before,@After, @AfterThrowing, @AfterReturning,@Around specifications
//    //The pointcut will look for the @YourAnnotation
//    @Pointcut("@annotation(report_task)")
//    public void annotationPointCutDefinition(){
//    }
// 
//    //Defines a pointcut that we can use in the @Before,@After, @AfterThrowing, @AfterReturning,@Around specifications
//    //The pointcut is a catch all pointcut with the scope of execution
//    @Pointcut("execution(* *(..))")
//    public void atExecution(){}
// 
//    @Before("annotationPointCutDefinition() && atExecution()")
//    //JointPoint = the reference of the call to the method
//    public void printNewLine(JoinPoint pointcut){
//        //Just prints new lines after each method that's executed in
//        System.out.println("annotated pointcut");
//    }
//}




@Aspect
public class TaskReporter {
	@Pointcut("@annotation(var_name)")
    public void annotationPointCutDefinition(report_task var_name){
    }
    //Defines a pointcut that we can use in the @Before,@After, @AfterThrowing, @AfterReturning,@Around specifications
    //The pointcut is a catch all pointcut with the scope of execution
    @Pointcut("execution(* *(..))")
    public void atExecution(){}
 
    @Around("annotationPointCutDefinition(var_name) && atExecution()")
    //ProceedingJointPoint = the reference of the call to the method.
    //Difference between ProceedingJointPoint and JointPoint is that a JointPoint can't be continued(proceeded)
    //A ProceedingJointPoint can be continued(proceeded) and is needed for a Around advice
    public Object aroundAdvice(ProceedingJoinPoint joinPoint, report_task var_name) throws Throwable {
        //Default Object that we can use to return to the consumer
        Object returnObject = null;
        try {
        	System.out.println("------------------------------START-------------------------------");
            System.out.println("BEFORE DECORATED METHOD INVOCATION");
            //We choose to continue the call to the method in question
            
            System.out.println("NAME IN DECORATOR:");	
            System.out.println(var_name.name());
            System.out.println("OWNER IN DECORATOR:");
            System.out.println(var_name.owner());
            System.out.println("DECORATED METHOD NAME:");
            System.out.println(MethodSignature.class.cast(joinPoint.getSignature()).getMethod().getName());
            System.out.println("ARGUMENTS OF METHOD:");
            for(int i=0;i<joinPoint.getArgs().length;i++) {
            	System.out.println(joinPoint.getArgs()[i]);
            }
            

            returnObject = joinPoint.proceed();
            
            System.out.println("RETURN FROM METHOD");
            System.out.println(returnObject);
            //If no exception is thrown we should land here and we can modify the returnObject, if we want to.
        } catch (Throwable throwable) {
            //Here we can catch and modify any exceptions that are called
            //We could potentially not throw the exception to the caller and instead return "null" or a default object.
        	System.out.println("EXCEPTION MESSAGE:");
        	System.out.println(throwable.getMessage());
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            throwable.printStackTrace(pw);
            String sStackTrace = sw.toString(); // stack trace as a string
            System.out.println("EXCEPTION TRACE:");
            System.out.println(sStackTrace);
        	throw throwable;
        }
        finally {
            //If we want to be sure that some of our code is executed even if we get an exception
            System.out.println("AFTER DECORATED METHOD INVOCATION");
            System.out.println("------------------------------END-------------------------------");
        }
        return returnObject;
    }
	
}