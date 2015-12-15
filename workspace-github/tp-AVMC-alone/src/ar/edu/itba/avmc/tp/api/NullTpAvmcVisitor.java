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

}
