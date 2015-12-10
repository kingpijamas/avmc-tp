package ar.edu.itba.avmc.tp.api;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Type;

public class NullTpAvmcVisitor extends TpAvmcVisitor {

    public NullTpAvmcVisitor(CompilationUnit unit, AST ast) {
        super(unit, ast);
    }

    @Override
    public boolean isInScope(Type type) {
        return type!=null && !type.isPrimitiveType();
    }

}
