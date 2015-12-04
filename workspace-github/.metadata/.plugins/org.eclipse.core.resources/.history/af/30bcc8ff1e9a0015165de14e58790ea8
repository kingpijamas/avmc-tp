package lalala;

import java.util.Iterator;
import java.util.Set;


import gigadot.rebound.Rebound;



public class oooo {
   public static void main(String[] args) throws Exception {
      Rebound r = new Rebound("lalala");
      CheckAnnotationParser parser = new CheckAnnotationParser();
      
      Set<Class<? extends Object>> classes = r.getSubClassesOf(Object.class);
      Iterator<Class<? extends Object>> iter = classes.iterator();
      while (iter.hasNext()) {
          parser.parse(iter.next());
      }



   }
}