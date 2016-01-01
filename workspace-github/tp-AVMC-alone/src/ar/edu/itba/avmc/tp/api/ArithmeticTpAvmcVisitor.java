package ar.edu.itba.avmc.tp.api;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.InfixExpression;
import org.eclipse.jdt.core.dom.NumberLiteral;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.InfixExpression.Operator;


public class ArithmeticTpAvmcVisitor extends TpAvmcVisitor{

    public ArithmeticTpAvmcVisitor(CompilationUnit unit, AST ast) {
        super(unit, ast);
    }

    @Override
    public boolean isInScope(Type type) {
        if(type == null){
            return false;
        }
        String typeName=type.toString();
        return typeName!=null && typeName.contains("int") /*|| typeName.contains("Double")*/;
    }

    @Override
    public InfixExpression getLogicalCheck(String variableName) {
        NumberLiteral zero = ast.newNumberLiteral("0");
        SimpleName variableSimpleName = ast.newSimpleName(variableName);
        return createinfixExpression(variableSimpleName, Operator.EQUALS, zero);
        
    }
    
    @Override
    public boolean visit(InfixExpression node) {
        //System.out.println("Usage of expresion '" + node.toString() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        List<String> canariesNames = denominatorVariables(node.toString());
        if(!canariesNames.isEmpty()){
               
           ASTNode expression = ASTNode.copySubtree(ast, node.getParent());
           ASTNode new_if = ifst((Expression)expression, canariesNames);
           
           rewrite.replace(node.getParent().getParent(), new_if, null);
       
        }
        return false;
    }
    
   

}
