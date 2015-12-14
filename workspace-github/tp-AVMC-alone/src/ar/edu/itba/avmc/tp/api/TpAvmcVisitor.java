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
import org.eclipse.jdt.core.dom.Assignment;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.BlockComment;
import org.eclipse.jdt.core.dom.BooleanLiteral;
import org.eclipse.jdt.core.dom.CatchClause;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.ConditionalExpression;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.ExpressionStatement;
import org.eclipse.jdt.core.dom.IfStatement;
import org.eclipse.jdt.core.dom.InfixExpression;
import org.eclipse.jdt.core.dom.InfixExpression.Operator;
import org.eclipse.jdt.core.dom.Javadoc;
import org.eclipse.jdt.core.dom.MethodDeclaration;
import org.eclipse.jdt.core.dom.MethodInvocation;
import org.eclipse.jdt.core.dom.NumberLiteral;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.SingleVariableDeclaration;
import org.eclipse.jdt.core.dom.Statement;
import org.eclipse.jdt.core.dom.StringLiteral;
import org.eclipse.jdt.core.dom.TryStatement;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;

public abstract class TpAvmcVisitor extends ASTVisitor{

    private Map<String, List<String>> methodsNamesMap = new HashMap<String,List<String>>();
    
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
    
    /**
     * Returns if a variable type is in the analysis scope of the visitor 
     * (ie: you cannot analyze in the same way an arithmetic exception
     * that a null pointer exception)
     * 
     * */
    public abstract boolean isInScope(Type type);
    
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
            if(isInScope(node.getType())){
                SimpleName name = fragment.getName();
                String canaryName = "canary$"+name.getIdentifier();
                // como antes pasa por el visit de MethodDeclaration, seguro methodCanaries no va a ser null 
                List<String> methodCanaries =this.methodsNamesMap.get(methodsNames.peek());
                methodCanaries.add(canaryName);
                //this.names.add(canaryName);
                
                
                System.out.println("Declaration of '" + name +" with type "+ node.getType() + "' at line"
                        + unit.getLineNumber(name.getStartPosition()));
                
                
                VariableDeclarationStatement statement = createDeclarationStatement(ast, ast.newSimpleName("Boolean"), canaryName);
                //ListRewrite listRewrite= rewrite.getListRewrite(node.getParent(), Block.STATEMENTS_PROPERTY);
                ListRewrite listRewrite= rewrite.getListRewrite(node, VariableDeclarationStatement.MODIFIERS2_PROPERTY);
                //Statement placeHolder= (Statement) rewrite.createStringPlaceholder("//mycomment", ASTNode.EMPTY_STATEMENT);
                
                listRewrite.insertLast(statement, null);
                
            }
            
        }
        
        
        return false; // do not continue 
    }

    
    
    @Override
    public boolean visit(InfixExpression node) {
        System.out.println("--------");
        System.out.println("Usage of expresion '" + node.toString() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        BlockComment block =ast.newBlockComment();
        ASTNode parent= node.getParent();
        /*List<String> ans=denominatorVariables(node.getExpression().toString());
        for (String s: ans){
            System.out.println("lala: "+ans);
        }*/
        return true;
    }
    
    /*@Override
    public boolean visit(ExpressionStatement node) {
        
        System.out.println("Usage of expresion '" + node.getExpression() + "' at line " + unit.getLineNumber(node.getStartPosition()));
        BlockComment block =ast.newBlockComment();
        List<String> ans=denominatorVariables(node.getExpression().toString());
        for (String s: ans){
            System.out.println("lala: "+ans);
        }
        return true;
    }
    */ 
    
    @Override
    public boolean visit(SimpleName node) {
        List<String> canaryNames = methodsNamesMap.get(methodsNames.peek());
        String node_canary = "canary$"+node.getIdentifier();
        if (canaryNames.contains(node_canary)) {
            System.out.println("Usage of '" + node + "' at line "
                    + unit.getLineNumber(node.getStartPosition()));
            System.out.println("Este es el parent "+node.getParent() );
            System.out.println("variable es denominador: "+ isDenominator(node.getParent().toString(), node.getIdentifier()));
            if(isDenominator(node.getParent().toString(), node.getIdentifier())){
              ListRewrite listRewrite;
                if(node.getParent() instanceof InfixExpression){
                    listRewrite= rewrite.getListRewrite(node.getParent(),InfixExpression.EXTENDED_OPERANDS_PROPERTY);
                }
                else{
                    listRewrite= rewrite.getListRewrite(node.getParent(), VariableDeclarationStatement.MODIFIERS2_PROPERTY);
                }

            ASTNode expression = ASTNode.copySubtree(ast, node.getParent().getParent());
            ASTNode new_if = ifst((Expression)expression);
            listRewrite.insertLast(new_if, null);
            System.out.println(new_if);
            }
        }
        return true;
    }
    
    public boolean visit(IfStatement node) {
        System.out.println("paso por if: "+node.toString());
        Expression cond = node.getExpression();
        System.out.println("cond es " + cond);
        
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
    
    private boolean isDenominator(String expression, String variable){
        String[] tokens = expression.split("/");
        if(tokens.length<2){
            return false;
        }
        return tokens[1].contains(variable);
    }
    
    private List<String> denominatorVariables(String expression){
        List<String> answers = new ArrayList<String>();
        
        String[] tokens = expression.split("/");
        if (tokens.length>=2){
            List<String> canaryNames = methodsNamesMap.get(methodsNames.peek());
            for(int j=1;j<tokens.length;j++){
                String s=tokens[j];
                for(int i=0;i<s.length();i++){
                    
                    if(canaryNames.contains("canary$"+s.charAt(i))){
                        answers.add("canary$"+s.charAt(i));
                    }
                }
            }
        }
        return answers;
    }
    
    private ASTNode ifst(Expression replacement){
        IfStatement ifs = ast.newIfStatement();
        
        //StringLiteral condition= ast.newStringLiteral();
        NumberLiteral zero = ast.newNumberLiteral("0");
        StringLiteral then_stat= ast.newStringLiteral();
        SimpleName variableName = ast.newSimpleName("a");
        
        
        InfixExpression condition = ast.newInfixExpression();
        condition.setRightOperand(zero);
        condition.setOperator(Operator.EQUALS);
        condition.setLeftOperand(variableName);
        
        Block block_then = ast.newBlock();
        Block block_else = ast.newBlock();
        
        block_then.setStructuralProperty(then_stat.getLocationInParent(), then_stat);
        Assignment as=ast.newAssignment();
        SimpleName canaryName = ast.newSimpleName("canary$a");
        BooleanLiteral flag = ast.newBooleanLiteral(true);
        as.setLeftHandSide(canaryName);
        as.setRightHandSide(flag);
        
        //then_stat.setLiteralValue("canary$a = true");
        
        
        ifs.setExpression(condition);
        
        ifs.setThenStatement(block_then);
        ifs.setElseStatement(block_else);
        
        ListRewrite listRewrite = rewrite.getListRewrite(block_then, Block.STATEMENTS_PROPERTY);    
        listRewrite.insertFirst(ast.newExpressionStatement(as), null);
        listRewrite = rewrite.getListRewrite(block_else, Block.STATEMENTS_PROPERTY);    
        
        listRewrite.insertFirst(ast.newExpressionStatement(replacement), null);
        
        
        
        return ifs;
        
    }
}
