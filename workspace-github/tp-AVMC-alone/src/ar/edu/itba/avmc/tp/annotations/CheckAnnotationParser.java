package ar.edu.itba.avmc.tp.annotations;

import java.lang.reflect.Method;

public class CheckAnnotationParser {
    
    public void parse(Class<?> clazz) throws Exception {
       String className = clazz.getCanonicalName();
       Method[] methods = clazz.getMethods();
       for (Method method : methods) {
          if (method.isAnnotationPresent(check.class)) {
             check test = method.getAnnotation(check.class);
             
             String info = test.value();
             if ("Arithmetic".equals(info)) {
                 System.out.println("annotation arithmetic exception");
                 // try to invoke the method with param
                 Class<?> l =method.getDeclaringClass();
                 method.invoke(
                    l.newInstance(),
                    info
                 );
             }
             else if ("NullPointer".equals(info)){
                 System.out.println("annotation nullpointer exception");
                 // try to invoke the method with param
                 
                 Class<?> l =method.getDeclaringClass();
                 method.invoke(l.newInstance(), info);
             }
             
          }
       }
    }
 }