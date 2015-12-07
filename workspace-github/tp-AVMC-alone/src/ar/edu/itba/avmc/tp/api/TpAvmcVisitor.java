package ar.edu.itba.avmc.tp.api;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.BooleanLiteral;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.ExpressionStatement;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.Statement;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;

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
    public boolean visit(VariableDeclarationStatement node) {
        
        List<VariableDeclarationFragment> fragments = node.fragments();
        
        for (VariableDeclarationFragment fragment : fragments) {
            SimpleName name = fragment.getName();
            this.names.add(name.getIdentifier());
            System.out.println("Declaration of '" + name + "' at line"
                    + unit.getLineNumber(name.getStartPosition()));
            
            
            VariableDeclarationStatement statement = createDeclarationStatement(ast, ast.newSimpleName("Boolean"), "canary$"+name);
            //ListRewrite listRewrite= rewrite.getListRewrite(node.getParent(), Block.STATEMENTS_PROPERTY);
            ListRewrite listRewrite= rewrite.getListRewrite(node, VariableDeclarationStatement.MODIFIERS2_PROPERTY);
            //Statement placeHolder= (Statement) rewrite.createStringPlaceholder("//mycomment", ASTNode.EMPTY_STATEMENT);
            
            listRewrite.insertLast(statement, null);
        }
        
        
        return false; // do not continue 
    }

    
    @Override
    public boolean visit(ExpressionStatement node) {
        
        System.out.println("Usage of expresion '" + node + "' at line " + unit.getLineNumber(node.getStartPosition()));
        
        return true;
    }
    
    @Override
    public boolean visit(SimpleName node) {
        if (this.names.contains(node.getIdentifier())) {
            System.out.println("Usage of '" + node + "' at line "
                    + unit.getLineNumber(node.getStartPosition()));
        }
        return true;
    }
    
    private VariableDeclarationStatement createDeclarationStatement(AST ast, SimpleName typeSimpleName, String variableName){
     // create an empty variable declaration fragment
        VariableDeclarationFragment canaryFragment = ast
                .newVariableDeclarationFragment();

        // set the initializer
        canaryFragment.setInitializer(ast.newBooleanLiteral(false));

        // set the name
        canaryFragment.setName(ast.newSimpleName(variableName));

        // create a statement for the fragment
        VariableDeclarationStatement statement = ast
                .newVariableDeclarationStatement(canaryFragment);

        // set the type of the variable declaration statement
        
        Type type = ast.newSimpleType(typeSimpleName);
        //Type type = ((VariableDeclarationStatement) fragment.getParent()).getType();
        statement.setType((Type) ASTNode.copySubtree(ast, type));
        return statement;
    }
}
