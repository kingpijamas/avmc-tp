package ar.edu.output.junit;
           import java.net.URL;
           import java.net.URLClassLoader;
           import java.net.MalformedURLException;
           import java.io.File;
           import java.lang.reflect.InvocationTargetException;

import java.lang.reflect.Method;
import java.lang.reflect.Field;
import org.junit.Test;
import java.util.HashMap;
public class NodeCachingLinkedListContainsBug3x2x6DTest_contains_0 {

    public HashMap<String, Object> theData = getInstance();

    public HashMap getInstance() {
    try {
    pldi.nodecachinglinkedlist.NodeCachingLinkedListContainsBug3x2x6D instance = new pldi.nodecachinglinkedlist.NodeCachingLinkedListContainsBug3x2x6D();
    pldi.nodecachinglinkedlist.LinkedListNode _LinkedListNode_1 = new pldi.nodecachinglinkedlist.LinkedListNode();
    pldi.nodecachinglinkedlist.LinkedListNode _LinkedListNode_2 = new pldi.nodecachinglinkedlist.LinkedListNode();
    java.lang.Object arg = new java.lang.Object();
    // Fields Initialization for 'instance'
    // Fields Initialization for '_LinkedListNode_1'
    updateValue(_LinkedListNode_1, "previous", _LinkedListNode_1);
    updateValue(_LinkedListNode_1, "next", _LinkedListNode_1);
    updateValue(_LinkedListNode_1, "value", _LinkedListNode_2);
    updateValue(instance, "header", _LinkedListNode_1);
    updateValue(instance, "firstCachedNode", null);
    updateValue(instance, "maximumCacheSize", 0);
    updateValue(instance, "cacheSize", -5);
    updateValue(instance, "size", 0);
    updateValue(instance, "DEFAULT_MAXIMUM_CACHE_SIZE", 3);
    updateValue(instance, "modCount", 6);
    // Parameter Initialization
    

    HashMap<String, Object> requiredData = new HashMap<String, Object>();
    requiredData.put("thiz", instance);
    requiredData.put("arg", arg);
    return requiredData;
    } catch (Exception ex) {ex.printStackTrace();}
    return null;
    }

    /**
     * Auxiliar function that embed awful reflection code
     * 
     * @param instance
     * @param fieldName
     * @param value
     */
    private void updateValue(Object instance, String fieldName, Object value) {
        for (Field aField : instance.getClass().getDeclaredFields()) {
            if (aField.getName().equals(fieldName)) {
                try {
                    aField.setAccessible(true);
                    if (aField.getType().isPrimitive()) {
                        String typeSimpleName = aField.getType().getSimpleName();
                        if (typeSimpleName.equals("boolean")) {
                            aField.setBoolean(instance, (Boolean) value);
                        } else if (typeSimpleName.endsWith("byte")) {
                            aField.setByte(instance, (Byte) value);
                        } else if (typeSimpleName.endsWith("char")) {
                            aField.setChar(instance, (Character) value);
                        } else if (typeSimpleName.endsWith("double")) {
                            aField.setDouble(instance, (Double) value);
                        } else if (typeSimpleName.endsWith("float")) {
                            aField.setFloat(instance, (Float) value);
                        } else if (typeSimpleName.endsWith("int")) {
                            aField.setInt(instance, (Integer) value);
                        } else if (typeSimpleName.endsWith("long")) {
                            aField.setLong(instance, (Long) value);
                        } else if (typeSimpleName.endsWith("short")) {
                            aField.setShort(instance, (Short) value);
                        } else {
                            System.out.println("ERROR: No difinida");
                        }
                    } else {
                        aField.set(instance, value);
                    };

                    aField.setAccessible(false);
                } catch (IllegalArgumentException e) {
           throw(new java.lang.RuntimeException(e));
                } catch (IllegalAccessException e) {
           throw(new java.lang.RuntimeException(e));
                }
            }
        }
    }

    /**
     * Auxiliar function that embed awful reflection code
     * 
     * @param className
     * @param methodName
     * @param value
     */
    private Method getAccessibleMethod(Class<?> clazz, String methodName, boolean value) {
        try {
        } catch (Exception e) {
            throw new RuntimeException("DYNJALLOY ERROR! " + e.getMessage());
        }

        Method methodToCheck = null;
        try {
            // Gets parameters types
            Class<?>[] parameterTypes = null;
            for (Method aMethod: clazz.getDeclaredMethods()) {
                if (aMethod.getName().equals(methodName)) {
                    parameterTypes = aMethod.getParameterTypes();
                }
            }
            methodToCheck = clazz.getDeclaredMethod(methodName, parameterTypes);
        } catch (SecurityException e) {
            throw new RuntimeException("DYNJALLOY ERROR! " + e.getMessage());
        } catch (NoSuchMethodException e) {
            throw new RuntimeException("DYNJALLOY ERROR! " + e.getMessage());
        }
        methodToCheck.setAccessible(value);

        return methodToCheck;
    }

    @Test
    public void testcontains_0(String fileClasspath, String className, String methodName) throws IllegalAccessException, InvocationTargetException, ClassNotFoundException, InstantiationException, MalformedURLException {
           String[] classpaths = fileClasspath.split(System.getProperty("path.separator"));
           URL[] urls = new URL[classpaths.length];
           for (int i = 0 ; i < classpaths.length ; ++i) {
           urls[i] = new File(classpaths[i]).toURI().toURL();
           }
           ClassLoader cl2 = new URLClassLoader(urls);
           Class<?> clazz = cl2.loadClass(className);
           Object instance = clazz.newInstance();
           cl2 = null;
        pldi.nodecachinglinkedlist.LinkedListNode _LinkedListNode_1 = new pldi.nodecachinglinkedlist.LinkedListNode();
        pldi.nodecachinglinkedlist.LinkedListNode _LinkedListNode_2 = new pldi.nodecachinglinkedlist.LinkedListNode();
        java.lang.Object arg = new java.lang.Object();
        // Fields Initialization for 'instance'
        // Fields Initialization for '_LinkedListNode_1'
        updateValue(_LinkedListNode_1, "previous", _LinkedListNode_1);
        updateValue(_LinkedListNode_1, "next", _LinkedListNode_1);
        updateValue(_LinkedListNode_1, "value", _LinkedListNode_2);
        updateValue(instance, "header", _LinkedListNode_1);
        updateValue(instance, "firstCachedNode", null);
        updateValue(instance, "maximumCacheSize", 0);
        updateValue(instance, "cacheSize", -5);
        updateValue(instance, "size", 0);
        updateValue(instance, "DEFAULT_MAXIMUM_CACHE_SIZE", 3);
        updateValue(instance, "modCount", 6);
        // Parameter Initialization
        
        // Method Invocation
        Method method = getAccessibleMethod(clazz, methodName, true);
        try {
            method.invoke(instance, new Object[]{arg});
           instance = null;
           method = null;
        } catch (Exception e) {
           throw(new java.lang.RuntimeException(e));
        } 

    }
}
