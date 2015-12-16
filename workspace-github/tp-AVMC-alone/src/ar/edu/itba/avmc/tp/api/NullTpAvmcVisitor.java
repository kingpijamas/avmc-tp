package ar.edu.itba.avmc.tp.api;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.ExpressionStatement;
import org.eclipse.jdt.core.dom.InfixExpression;
import org.eclipse.jdt.core.dom.NumberLiteral;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.StringLiteral;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.InfixExpression.Operator;
import org.eclipse.jdt.core.dom.MethodInvocation;
import org.eclipse.jdt.core.dom.NullLiteral;

public class NullTpAvmcVisitor extends TpAvmcVisitor {

    public NullTpAvmcVisitor(CompilationUnit unit, AST ast) {
        super(unit, ast);
    }

    @Override
    public boolean isInScope(Type type) {
        return type!=null && !type.isPrimitiveType();
    }

    @Override
    public InfixExpression getLogicalCheck(String variableName) {
        NullLiteral nullLiteral = ast.newNullLiteral();
        SimpleName variableSimpleName = ast.newSimpleName(variableName);
        
        return createinfixExpression(variableSimpleName, Operator.EQUALS, nullLiteral);
        
    }
    
    /*@Override
    public boolean visit(ExpressionStatement node) {
        System.out.println("--------");
        System.out.println("NullPointer");
        System.out.println("Usage of expresion '" + node.toString() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        
        return true;
    }*/
    
    @Override
    public boolean visit(MethodInvocation node) {
        // in MethodInvocation the Expression is the variable which method is invoked
        // and Name is the method itself
        System.out.println("--------");
        System.out.println("NullPointer");
        System.out.println("Usage of expresion '" + node.toString() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        System.out.println(node.getName());
        List<String> canaryNames = methodsNamesMap.get(methodsNames.peek());
        Expression variable = node.getExpression();
        if( canaryNames.contains( variable.toString()) ){
            ASTNode expression = ASTNode.copySubtree(ast, node);
            ASTNode new_if = ifst((Expression)expression, canaryNames);
            
            rewrite.replace(node.getParent(), new_if, null);
        }
        System.out.println(node.getExpression());
        System.out.println("·······");
        return false;
    }
    
    @Override
    public boolean visit(InfixExpression node) {
        System.out.println("--------");
        System.out.println("NullPointer InfixExpression");
        System.out.println("Usage of expresion '" + node.toString() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        List<String> canariesNames = denominatorVariables(node.toString());
        if(!canariesNames.isEmpty()){
               
           ASTNode expression = ASTNode.copySubtree(ast, node.getParent());
           ASTNode new_if = ifst((Expression)expression, canariesNames);
           
           rewrite.replace(node.getParent().getParent(), new_if, null);
       
        }
        return false;
    }
    
}
