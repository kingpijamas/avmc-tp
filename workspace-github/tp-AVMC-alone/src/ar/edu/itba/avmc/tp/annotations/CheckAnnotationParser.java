package ar.edu.itba.avmc.tp.annotations;

import java.io.File;
import java.lang.reflect.Method;

import ar.edu.itba.avmc.tp.api.ParserAPIImpl;
import ar.edu.taco.utils.FileUtils;

public class CheckAnnotationParser {
    
    public void parse(Class<?> clazz) throws Exception {
       
       
       Method[] methods = clazz.getMethods();
       for (Method method : methods) {
          if (method.isAnnotationPresent(Check.class)) {
             Check annotation = method.getAnnotation(Check.class);
             String className = FileUtils.normalizatePackageName(clazz.getCanonicalName());
             String info = annotation.value();
                  
             if ("Arithmetic".equals(info)) {
                 System.out.println("annotation arithmetic exception");
                 
             }
             else if ("NullPointer".equals(info)){
                 System.out.println("annotation nullpointer exception");
                 
             }
             
             File dirs = new File(".");
             String dirPath = dirs.getCanonicalPath() + File.separator+"src"+File.separator+className+".java";
             String newDirPath = dirs.getCanonicalPath() + File.separator+"results"+File.separator+className+".java";             
             String str=FileUtils.readFile(dirPath);
             
             new ParserAPIImpl().parse(str, method.getName(),newDirPath);
             
          }
       }
    }
 }