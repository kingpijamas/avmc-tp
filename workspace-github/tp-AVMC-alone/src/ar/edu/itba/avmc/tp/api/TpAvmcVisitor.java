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
import org.eclipse.jdt.core.dom.AnnotationTypeDeclaration;
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
import org.eclipse.jdt.core.dom.PrimitiveType;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.SingleMemberAnnotation;
import org.eclipse.jdt.core.dom.SingleVariableDeclaration;
import org.eclipse.jdt.core.dom.Statement;
import org.eclipse.jdt.core.dom.StringLiteral;
import org.eclipse.jdt.core.dom.TryStatement;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;
import org.eclipse.text.edits.TextEditGroup;

public abstract class TpAvmcVisitor extends ASTVisitor{

    protected Map<String, List<String>> methodsNamesMap = new HashMap<String,List<String>>();
    
    protected Stack<String> methodsNames = new Stack<String>();
    
    protected CompilationUnit unit;
    protected AST ast;
    protected ASTRewrite rewrite;
    
    
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
    
    /**
     * Returns the logical expression used in "if canary"
     * */
    public abstract InfixExpression getLogicalCheck(String variableName);
    
    
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
    
    
    /**
     * The SingleMemberAnnotation refers to Annotation invocation
     * (taco don't accept sources with annotations, so we need to remove them all)
     * 
     * */
    @Override
    public boolean visit(SingleMemberAnnotation node){
        
        /* This seems to be another way to delete nodes*/
        rewrite.replace(node, null, null);
        return false;
    }
    
    
    @Override
    public boolean visit(VariableDeclarationStatement node) {
        
        List<VariableDeclarationFragment> fragments = node.fragments();
        
        for (VariableDeclarationFragment fragment : fragments) {
            if(isInScope(node.getType())){
                SimpleName name = fragment.getName();
                String canaryName = name.getIdentifier();
                // como antes pasa por el visit de MethodDeclaration, seguro methodCanaries no va a ser null 
                List<String> methodCanaries =this.methodsNamesMap.get(methodsNames.peek());
                methodCanaries.add(canaryName);
                
                System.out.println("Declaration of '" + name +" with type "+ node.getType() + "' at line"
                        + unit.getLineNumber(name.getStartPosition()));
                PrimitiveType type = ast.newPrimitiveType(PrimitiveType.BOOLEAN);
                VariableDeclarationStatement statement = createDeclarationStatement(ast, type, "canary$"+canaryName);
                //ListRewrite listRewrite= rewrite.getListRewrite(node.getParent(), Block.STATEMENTS_PROPERTY);
                ListRewrite listRewrite= rewrite.getListRewrite(node, VariableDeclarationStatement.MODIFIERS2_PROPERTY);
                //Statement placeHolder= (Statement) rewrite.createStringPlaceholder("//mycomment", ASTNode.EMPTY_STATEMENT);
                
                listRewrite.insertLast(statement, null);
                
            }
            
        }
        
        return false; // do not continue 
    }
  
    
    private VariableDeclarationStatement createDeclarationStatement(AST ast, SimpleName typeSimpleName, String variableName){
        Type type = ast.newSimpleType(typeSimpleName);
        return createDeclarationStatement(ast,type,variableName);
        
    }
    
    private VariableDeclarationStatement createDeclarationStatement(AST ast, Type type, String variableName){
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
           
           
           //Type type = ((VariableDeclarationStatement) fragment.getParent()).getType();
           statement.setType((Type) ASTNode.copySubtree(ast, type));
           return statement;
       }
    
    /*
     * Creates the jml contract to use later with TACO
     * */
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
            String canaryName = "canary$"+it.next();
            jml_buffer.append(canaryName+" == false");
            first = false;
        }
        jml_buffer.append("; @*/\n");
        
        BlockComment javadoc= (BlockComment) rewrite.createStringPlaceholder(jml_buffer.toString(), ASTNode.BLOCK_COMMENT);
        
        return javadoc;
    }
    
    
    protected List<String> denominatorVariables(String expression){
        List<String> answers = new ArrayList<String>();
        
        String[] tokens = expression.split("/");
        if (tokens.length>=2){
            List<String> canaryNames = methodsNamesMap.get(methodsNames.peek());
            for(int j=1;j<tokens.length;j++){
                String s=tokens[j];
                Iterator<String> it=canaryNames.iterator();
                boolean contains = false;
                while(it.hasNext() && !contains){
                    String variableName=it.next();
                    if(s.contains(variableName)){
                        contains = true;
                        answers.add(variableName);
                    }
                }

            }
        }
        return answers;
    }
    
    protected ASTNode ifst(Expression replacement, List<String> variables){
        IfStatement ifs = ast.newIfStatement();
        
        StringLiteral then_stat= ast.newStringLiteral();
        
        InfixExpression condition = getLogicalCheck(variables.get(0));
        
        Block block_then = ast.newBlock();
        Block block_else = ast.newBlock();
        
        block_then.setStructuralProperty(then_stat.getLocationInParent(), then_stat);
        SimpleName canaryName = ast.newSimpleName("canary$"+variables.get(0));
        Assignment as = createAssignment(canaryName, ast.newBooleanLiteral(true));
        
        ifs.setExpression(condition);
        
        ifs.setThenStatement(block_then);
        ifs.setElseStatement(block_else);
        
        ListRewrite listRewrite = rewrite.getListRewrite(block_then, Block.STATEMENTS_PROPERTY);    
        listRewrite.insertFirst(ast.newExpressionStatement(as), null);
        listRewrite = rewrite.getListRewrite(block_else, Block.STATEMENTS_PROPERTY);    
        
        listRewrite.insertFirst(ast.newExpressionStatement(replacement), null);
        
        return ifs;
        
    }
    
    protected InfixExpression createinfixExpression(Expression leftOperand,Operator op, Expression rightOperand){
        InfixExpression expression = ast.newInfixExpression();
        expression.setRightOperand(rightOperand);
        expression.setOperator(op);
        expression.setLeftOperand(leftOperand);
        return expression;
    }
    
    private Assignment createAssignment(Expression leftSide, Expression rightSide){
        Assignment assignment=ast.newAssignment();
        assignment.setLeftHandSide(leftSide);
        assignment.setRightHandSide(rightSide);
        return assignment;
    }
}
