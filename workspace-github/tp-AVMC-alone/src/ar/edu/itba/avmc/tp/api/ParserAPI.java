package ar.edu.itba.avmc.tp.api;

import java.util.List;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;

public interface ParserAPI {
    
    public void parse(List<String> methodName, String newFileName, TpAvmcVisitor visitor);
    
    public AST getAST();
    
    public CompilationUnit getUnit();
}
