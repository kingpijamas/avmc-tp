package ar.edu.itba.materia.avl;

import ar.edu.taco.regresion.CollectionTestBase;
import ar.uba.dc.rfm.dynalloy.visualization.VizException;

public class AvlTreeTest extends CollectionTestBase {

		@Override
		protected String getClassToCheck() {
			return "ar.edu.itba.materia.avl.AvlTree";
		}
		
		public void test_findMinTest() throws VizException {
			setConfigKeyRelevantClasses("ar.edu.itba.materia.avl.AvlTree,rar.edu.itba.materia.avl.AvlNode");
			setConfigKeyRelevancyAnalysis(true);
			setConfigKeyCheckNullDereference(true);
			setConfigKeyUseJavaArithmetic(true);
			setConfigKeyObjectScope(3);
			setConfigKeyInferScope(true);
			setConfigKeySkolemizeInstanceInvariant(false);
			setConfigKeySkolemizeInstanceAbstraction(false);
			setConfigKeyGenerateUnitTestCase(true);
			setConfigKeyUseJavaSBP(true);
			setConfigKeyUseTightUpperBounds(true);
			setConfigKeyTypeScopes("ar.edu.itba.materia.avl.AvlTree:1,ar.edu.itba.materia.avl.AvlNode:5");
			check(GENERIC_PROPERTIES,"findMin_0", false);
		}
	
		public void test_insertTest() throws VizException {
			setConfigKeyRelevantClasses("ar.edu.itba.materia.avl.AvlTree,ar.edu.itba.materia.avl.AvlNode");
			setConfigKeyRelevancyAnalysis(true);
			setConfigKeyCheckNullDereference(true);
			setConfigKeyUseJavaArithmetic(true);
			setConfigKeyObjectScope(3);
			setConfigKeyInferScope(true);
			setConfigKeySkolemizeInstanceInvariant(false);
			setConfigKeySkolemizeInstanceAbstraction(false);
			setConfigKeyGenerateUnitTestCase(true);
			setConfigKeyUseJavaSBP(true);
			setConfigKeyUseTightUpperBounds(true);
			setConfigKeyTypeScopes("ar.edu.itba.materia.avl.AvlTree:1,ar.edu.itba.materia.avl.AvlNode:5");
			check(GENERIC_PROPERTIES,"insert_0", false);
		}

		public void test_factorialTest() throws VizException {
			setConfigKeyRelevantClasses("ar.edu.itba.materia.avl.AvlTree,ar.edu.itba.materia.avl.AvlNode");
			setConfigKeyRelevancyAnalysis(true);
			setConfigKeyCheckNullDereference(true);
			setConfigKeyUseJavaArithmetic(true);
			setConfigKeyObjectScope(3);
			setConfigKeyInferScope(true);
			setConfigKeySkolemizeInstanceInvariant(false);
			setConfigKeySkolemizeInstanceAbstraction(false);
			setConfigKeyGenerateUnitTestCase(true);
			setConfigKeyUseJavaSBP(true);
			setConfigKeyUseTightUpperBounds(true);
			setConfigKeyTypeScopes("ar.edu.itba.materia.avl.AvlTree:1,ar.edu.itba.materia.avl.AvlNode:5");
			check(GENERIC_PROPERTIES,"factorial_0", false);
		}
		
		
		public void test_fiboTest() throws VizException {
			setConfigKeyRelevantClasses("ar.edu.itba.materia.avl.AvlTree,ar.edu.itba.materia.avl.AvlNode");
			setConfigKeyRelevancyAnalysis(true);
			setConfigKeyCheckNullDereference(true);
			setConfigKeyUseJavaArithmetic(true);
			setConfigKeyObjectScope(3);
			setConfigKeyInferScope(true);
			setConfigKeySkolemizeInstanceInvariant(false);
			setConfigKeySkolemizeInstanceAbstraction(false);
			setConfigKeyGenerateUnitTestCase(true);
			setConfigKeyUseJavaSBP(true);
			setConfigKeyUseTightUpperBounds(true);
			setConfigKeyTypeScopes("ar.edu.itba.materia.avl.AvlTree:1,ar.edu.itba.materia.avl.AvlNode:5");
			check(GENERIC_PROPERTIES,"fibo_0", false);
		}
}