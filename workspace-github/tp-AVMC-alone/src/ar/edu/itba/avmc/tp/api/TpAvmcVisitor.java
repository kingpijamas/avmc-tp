package ar.edu.itba.avmc.tp.api;

import java.util.HashSet;
import java.util.Set;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;

public class TpAvmcVisitor extends ASTVisitor{

    Set names = new HashSet();
    private CompilationUnit unit;
    private AST ast;
    private ASTRewrite rewrite;
    
    
    public TpAvmcVisitor(CompilationUnit unit, AST ast) {
        super();
        this.unit = unit;
        this.ast = ast;
        this.rewrite = ASTRewrite.create(ast);
        
    }
    
    public ASTRewrite getRewrite() {
        return rewrite;
    }
    
    @Override
    public boolean visit(VariableDeclarationFragment node) {
        SimpleName name = node.getName();
        this.names.add(name.getIdentifier());
        System.out.println("Declaration of '" + name + "' at line"
                + unit.getLineNumber(name.getStartPosition()));
        return false; // do not continue 
    }

    @Override
    public boolean visit(SimpleName node) {
        if (this.names.contains(node.getIdentifier())) {
            System.out.println("Usage of '" + node + "' at line "
                    + unit.getLineNumber(node.getStartPosition()));
        }
        return true;
    }
}
