package ar.edu.itba.avmc.tp.api;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.InfixExpression;
import org.eclipse.jdt.core.dom.NumberLiteral;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.StringLiteral;
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
        return typeName!=null && typeName.contains("int") || typeName.contains("Double");
    }

    @Override
    public InfixExpression getLogicalCheck(String variableName) {
        NumberLiteral zero = ast.newNumberLiteral("0");
        SimpleName variableSimpleName = ast.newSimpleName(variableName);
        
        return createinfixExpression(variableSimpleName, Operator.EQUALS, zero);
        
    }

}
