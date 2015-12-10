package ar.edu.itba.avmc.tp.api;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Type;


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

}
