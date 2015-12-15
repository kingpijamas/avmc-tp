package ar.edu.itba.avmc.tp.annotations;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;

import ar.edu.itba.avmc.tp.api.ArithmeticTpAvmcVisitor;
import ar.edu.itba.avmc.tp.api.NullTpAvmcVisitor;
import ar.edu.itba.avmc.tp.api.ParserAPI;
import ar.edu.itba.avmc.tp.api.ParserAPIImpl;
import ar.edu.itba.avmc.tp.api.TpAvmcVisitor;
import ar.edu.taco.utils.FileUtils;

public class CheckAnnotationParser {
    public static String ARITHMETIC_STRING = "Arithmetic";
    public static String NULLPOINTER_STRING = "NullPointer";
    
    public void parse(Class<?> clazz) throws Exception {
       
       
       Method[] methods = clazz.getMethods();
       String className = FileUtils.normalizatePackageName(clazz.getCanonicalName());
       List<String> methodNames = new ArrayList<String>();
       CheckAnnotationValues check_type = null;
       for (Method method : methods) {
          if (method.isAnnotationPresent(Check.class)) {
             Check annotation = method.getAnnotation(Check.class);
             
             String info = annotation.value();
                  
             if (ARITHMETIC_STRING.equals(info)) {
                 System.out.println("annotation arithmetic exception");
                 if(check_type==null){
                     check_type = CheckAnnotationValues.ARITHMETIC;
                 }
                 else if (check_type != CheckAnnotationValues.ARITHMETIC){
                     throw new IllegalArgumentException("All check Annotation Values must be the same for the same class!!!");
                 }
             }
             else if (NULLPOINTER_STRING.equals(info)){
                 System.out.println("annotation nullpointer exception");
                 if(check_type==null){
                     check_type = CheckAnnotationValues.NULL_POINTER;
                 }
                 else if (check_type != CheckAnnotationValues.NULL_POINTER){
                     throw new IllegalArgumentException("All check Annotation Values must be the same for the same class!!!");
                     
                 }
                 
             }
             methodNames.add(method.getName());    
          }
       }
       
       if(!methodNames.isEmpty()){
       File dirs = new File(".");
       String dirPath = dirs.getCanonicalPath() + File.separator+"src"+File.separator+className+".java";
       String newDirPath = dirs.getCanonicalPath() + File.separator+"results"+File.separator+className+".java";             
       String str=FileUtils.readFile(dirPath);
       ParserAPI parser = new ParserAPIImpl(str);
       
       TpAvmcVisitor visitor = getTpAvmcVisitor(check_type, parser.getUnit(), parser.getAST());
       parser.parse(methodNames,newDirPath,visitor);
       }
    }
    
    private TpAvmcVisitor getTpAvmcVisitor(CheckAnnotationValues type, CompilationUnit unit, AST ast){
        if(type == CheckAnnotationValues.ARITHMETIC){
            return new ArithmeticTpAvmcVisitor(unit, ast);
        }
        else if (type == CheckAnnotationValues.NULL_POINTER){
            return new NullTpAvmcVisitor(unit, ast);
        }
        return null;
    }
 }