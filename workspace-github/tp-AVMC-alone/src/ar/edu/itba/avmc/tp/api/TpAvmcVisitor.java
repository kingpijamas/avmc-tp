package ar.edu.itba.avmc.tp.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.BlockComment;
import org.eclipse.jdt.core.dom.BooleanLiteral;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.ExpressionStatement;
import org.eclipse.jdt.core.dom.Javadoc;
import org.eclipse.jdt.core.dom.MethodDeclaration;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.Statement;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;

public class TpAvmcVisitor extends ASTVisitor{

    private Map<String, List<String>> methodsNamesMap = new HashMap<String,List<String>>();
    //Set names = new HashSet();
    //private String currentMethod;
    Stack<String> methodsNames = new Stack<String>();
    
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
    public void endVisit(MethodDeclaration node) {
        
        System.out.println("------------");
        System.out.println("EndVisit de method"+ node.getName() + "with body '" + node.getBody() + "' at line"
                + unit.getLineNumber(node.getStartPosition()));
        
        //MethodDeclaration newNode =(MethodDeclaration)ASTNode.copySubtree(ast, node);
        String currentMethod = methodsNames.pop();
        BlockComment jml_block = createJMLComment(currentMethod);
        if(jml_block!=null){
            ListRewrite listRewrite = rewrite.getListRewrite(node, MethodDeclaration.MODIFIERS2_PROPERTY);
            //listRewrite.replace(node, newNode, null);
            listRewrite.insertAt(jml_block,1, null);
        }
        
        
    } 
    
    @Override
    public boolean visit(MethodDeclaration node) {
        
        methodsNames.push(node.getName().toString());
        if(methodsNamesMap.get(node.getName().toString())==null){
            methodsNamesMap.put(node.getName().toString(), new ArrayList<String>());
            
        }
        return super.visit(node);
    }
    
    @Override
    public boolean visit(VariableDeclarationStatement node) {
        
        List<VariableDeclarationFragment> fragments = node.fragments();
        
        for (VariableDeclarationFragment fragment : fragments) {
            SimpleName name = fragment.getName();
            String canaryName = "canary$"+name.getIdentifier();
            // como antes pasa por el visit de MethodDeclaration, seguro methodCanaries no va a ser null 
            List<String> methodCanaries =this.methodsNamesMap.get(methodsNames.peek());
            methodCanaries.add(canaryName);
            //this.names.add(canaryName);
            System.out.println("Declaration of '" + name + "' at line"
                    + unit.getLineNumber(name.getStartPosition()));
            
            
            VariableDeclarationStatement statement = createDeclarationStatement(ast, ast.newSimpleName("Boolean"), canaryName);
            //ListRewrite listRewrite= rewrite.getListRewrite(node.getParent(), Block.STATEMENTS_PROPERTY);
            ListRewrite listRewrite= rewrite.getListRewrite(node, VariableDeclarationStatement.MODIFIERS2_PROPERTY);
            //Statement placeHolder= (Statement) rewrite.createStringPlaceholder("//mycomment", ASTNode.EMPTY_STATEMENT);
            
            listRewrite.insertLast(statement, null);
        }
        
        
        return false; // do not continue 
    }

    
    
    @Override
    public boolean visit(ExpressionStatement node) {
        
        System.out.println("Usage of expresion '" + node.getExpression() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        BlockComment block =ast.newBlockComment();
        
        return true;
    }
    
    @Override
    public boolean visit(SimpleName node) {
        List<String> canaryNames = methodsNamesMap.get(methodsNames.peek());
        if (canaryNames.contains(node.getIdentifier())) {
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
    
    private BlockComment createJMLComment(String method){
        List<String> canaryNames = methodsNamesMap.get(method);
        if(canaryNames.isEmpty()){
            return null;
        }
        Iterator <String> it =canaryNames.iterator();
        
        StringBuffer jml_buffer = new StringBuffer("/*@ ensures ");
        boolean first = true;
        
        while(it.hasNext()){
            if(!first){
                jml_buffer.append(" && ");               
            }
            jml_buffer.append(it.next()+" == false ");
            first = false;
        }
        jml_buffer.append("; @*/\n");
        
        BlockComment javadoc= (BlockComment) rewrite.createStringPlaceholder(jml_buffer.toString(), ASTNode.BLOCK_COMMENT);
        
        return javadoc;
    }
}
