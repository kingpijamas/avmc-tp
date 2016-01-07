/*
 * TACO: Translation of Annotated COde
 * Copyright (c) 2010 Universidad de Buenos Aires
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA,
 * 02110-1301, USA
 */
package ar.edu.itba.ayvmc;

import java.util.Collection;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import java.util.Arrays;

import ar.edu.itba.avmc.tp.MainTP;
import ar.edu.taco.regresion.CollectionTestBase;
import ar.edu.taco.utils.FileUtils;
import ar.uba.dc.rfm.dynalloy.visualization.VizException;
import junit.framework.AssertionFailedError;
import roops.core.objects.junit.ArrayList;

@RunWith(Parameterized.class)
public class ejemploooTest extends CollectionTestBase {
    private String className;
    private String methodName;
    
    
    @Parameters
    public static Collection<Object[]> configs() {
 
        FileUtils.readPropertiesFile(MainTP.propertiesFileName);
        
        List<Object[]> lala = new java.util.ArrayList<Object[]>();
        Object[] lalo = {"ar.edu.itba.ayvmc.ejemplooo","wololoInt"};
        
        lala.add(lalo);
        lala.add(lalo);
        
        return FileUtils.readPropertiesFile(MainTP.propertiesFileName);      
    }
    
    
    public ejemploooTest(String className, String methodName) {
        this.className = className;
        this.methodName = methodName;
    }
    
    @Before
    @Override
    public void setUp() {
        super.setUp();
        
    }
    
	@Override
	protected String getClassToCheck() {
		return className;
	}

	/*public void test_sizeTest() throws VizException {
		setConfigKeyRelevantClasses("ar.edu.itba.ayvmc.BinTreeBug,ar.edu.itba.ayvmc.NodeBTBug");
        setConfigKeyRelevancyAnalysis(true);
        setConfigKeyCheckNullDereference(true);
        setConfigKeyUseJavaArithmetic(false);
        setConfigKeyObjectScope(3);
        setConfigKeyInferScope(true);
        setConfigKeySkolemizeInstanceInvariant(false);
        setConfigKeySkolemizeInstanceAbstraction(false);
        setConfigKeyGenerateUnitTestCase(true);
		setConfigKeyTypeScopes("ar.edu.itba.ayvmc.BinTreeBug:1,ar.edu.itba.ayvmc.NodeBTBug:2"); //te dice cuantas instancias podes tener como maximo (arboles de hasta cinco nodos)
		setConfigKeyLoopUnroll(1); 
        runAndCheck(GENERIC_PROPERTIES,"getSize_0",false);
	}*/

	@Test
	public void test_addTest() throws VizException {
	    startTestInformation();
		setConfigKeyRelevantClasses(className);
		setConfigKeyRelevancyAnalysis(true);
        setConfigKeyCheckNullDereference(true);
        setConfigKeyUseJavaArithmetic(false);
        setConfigKeyObjectScope(3);
        setConfigKeyInferScope(true);
        setConfigKeySkolemizeInstanceInvariant(false);
        setConfigKeySkolemizeInstanceAbstraction(false);
        setConfigKeyGenerateUnitTestCase(true);
		setConfigKeyTypeScopes(className+":1"); //te dice cuantas instancias podes tener como maximo (arboles de hasta cinco nodos)
		setConfigKeyLoopUnroll(1); 
		boolean ok= false;
		try{
		    runAndCheck(GENERIC_PROPERTIES,methodName+"_0",false);
		    ok = true;
		}
		catch(AssertionFailedError failed){
		    failedTestInformation();
		}
		finally{
		    if(ok){
		        passedTestInformation();
		    }
		}

	} 
	
	/*public void test_removeTest() throws VizException {
		setConfigKeyRelevantClasses("ar.edu.itba.ayvmc.BinTreeBug,ar.edu.itba.ayvmc.NodeBTBug");
        setConfigKeyRelevancyAnalysis(true);
        setConfigKeyCheckNullDereference(true);
        setConfigKeyUseJavaArithmetic(false);
        setConfigKeyObjectScope(3);
        setConfigKeyInferScope(true);
        setConfigKeySkolemizeInstanceInvariant(false);
        setConfigKeySkolemizeInstanceAbstraction(false);
        setConfigKeyGenerateUnitTestCase(true);
		setConfigKeyTypeScopes("ar.edu.itba.ayvmc.BinTreeBug:1,ar.edu.itba.ayvmc.NodeBTBug:2"); //te dice cuantas instancias podes tener como maximo (arboles de hasta cinco nodos)
		setConfigKeyLoopUnroll(1);
        runAndCheck(GENERIC_PROPERTIES,"remove_0",false);
	}
	*/
	
   /* public void test_lookupTest() throws VizException {
        setConfigKeyRelevantClasses("ar.edu.itba.alu.crpereyr.impl.rbtree1.RBTree,ar.edu.itba.alu.crpereyr.impl.rbtree1.Node");
        setConfigKeyRelevancyAnalysis(true);
        setConfigKeyCheckNullDereference(true);
        setConfigKeyUseJavaArithmetic(true);
        setConfigKeyObjectScope(3);
        setConfigKeyInferScope(true);
        setConfigKeySkolemizeInstanceInvariant(false);
        setConfigKeySkolemizeInstanceAbstraction(false);
        setConfigKeyGenerateUnitTestCase(true);
        runAndCheck(GENERIC_PROPERTIES,"lookup_0",false);
    }
    */
	
	private void startTestInformation(){
	    
	    System.out.println("\n-------------------------");
	    System.out.println("NEW CHECK");
	    System.out.println("CLASS NAME: "+className+" \t METHOD NAME: "+methodName);
	}
	
	private void failedTestInformation(){
	    System.out.println();
	    System.out.println("POSSIBILITY OF ERROR IN ");
        System.out.println("CLASS NAME: "+className+" \t METHOD NAME: "+methodName);
        System.out.println("\n-------------------------");
	}
	
	private void passedTestInformation(){
        System.out.println();
        System.out.println("NO ERROR IN ");
        System.out.println("CLASS NAME: "+className+" \t METHOD NAME: "+methodName);
        System.out.println("\n-------------------------");
    }
}
