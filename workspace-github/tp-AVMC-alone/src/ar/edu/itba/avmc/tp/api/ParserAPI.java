package ar.edu.itba.avmc.tp.api;

import java.util.List;
import java.util.Properties;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.CompilationUnit;

public interface ParserAPI {
    
    public void parse(String canonicalClassName, List<String> methodName, String newFileName, TpAvmcVisitor visitor, Properties propFile);
    
    public AST getAST();
    
    public CompilationUnit getUnit();
}
