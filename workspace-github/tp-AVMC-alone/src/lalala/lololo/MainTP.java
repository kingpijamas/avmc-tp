package lalala.lololo;


import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import ar.edu.itba.avmc.tp.annotations.CheckAnnotationParser;
import ar.edu.taco.utils.FileUtils;
import gigadot.rebound.Rebound;



public class MainTP {
    private static String propertiesComment = "ClassName - MethodName";
    public static String propertiesFileName = "tacoTestClassesMethods.properties";
   
    public static void main(String[] args) throws Exception {
      
      /* First, we run the annotation parser, in order to search which pairs of classes-methods we want to analyze
       * Then, the ParserAPI will parse the AST (helped by the visitors) and generate another source, in the tests folder, 
       * with the same name that the original (but decorated with jml instructions and canaries, necessary in TACO)
       * After that, in a properties file we store the classNames with the methods we want to check.
       * We restore them in a parameterized JUnit Test, and run TACO with each tuple of values  
       * */  
       
      Rebound r = new Rebound("");
      CheckAnnotationParser parser = new CheckAnnotationParser();
      Properties properties = new Properties();
      
      Set<Class<? extends Object>> classes = r.getSubClassesOf(Object.class);
      Iterator<Class<? extends Object>> iter = classes.iterator();
      while (iter.hasNext()) {
         try{
          parser.parse(iter.next(),properties);
         }catch(Exception e){
             e.printStackTrace();
         }
      }
      
      
      FileUtils.storeInPropertiesFile(propertiesFileName, propertiesComment, properties);
      
      
      try{
          
          org.junit.runner.JUnitCore.main("ar.edu.itba.ayvmc.ejemploooTest");
      }
      catch(Exception e){
          e.printStackTrace();
      }
      catch(Error error){
          System.out.println("Hubo un error!!!");
    
      }

   }
    

}