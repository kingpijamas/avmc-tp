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

import ar.edu.taco.regresion.CollectionTestBase;
import ar.uba.dc.rfm.dynalloy.visualization.VizException;

public class BinTreeBugTest extends CollectionTestBase {

	@Override
	protected String getClassToCheck() {
		return "ar.edu.itba.ayvmc.BinTreeBug";
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

	public void test_addTest() throws VizException {
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
        runAndCheck(GENERIC_PROPERTIES,"add_0",false);
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
}
