package ar.edu.itba.avmc.tp.api;


import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
 
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.ASTParser;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.AbstractTypeDeclaration;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.BodyDeclaration;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.ImportDeclaration;
import org.eclipse.jdt.core.dom.MethodDeclaration;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.Statement;
import org.eclipse.jdt.core.dom.TypeDeclaration;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;
import org.eclipse.jface.text.BadLocationException;
import org.eclipse.jface.text.Document;
import org.eclipse.jface.text.IDocument;
import org.eclipse.text.edits.MalformedTreeException;
import org.eclipse.text.edits.TextEdit;

import ar.edu.taco.utils.FileUtils;

 
public class ParserAPIImpl implements ParserAPI {
    
    final CompilationUnit unit;
    final AST ast;
    final IDocument document;
    
    public ParserAPIImpl(String source){
        org.eclipse.jdt.core.dom.ASTParser parser = org.eclipse.jdt.core.dom.ASTParser.newParser(org.eclipse.jdt.core.dom.AST.JLS4);

        parser.setSource(source.toCharArray());
        parser.setKind(ASTParser.K_COMPILATION_UNIT);
        
        document = new Document(source);
        
        // Parse the source code and generate an AST.
        unit = (CompilationUnit) parser.createAST(null);

        //Add imports to enable file output of the instrumented code
        ast = unit.getAST();
    }
    
    public AST getAST(){
        return ast;
    }
    
    public CompilationUnit getUnit(){
        return unit;
    }
    
    //use ASTParse to parse string
    public void parse(String canonicalClassName, List<String> methodNames, String newFileName, Visitor visitor, Properties propertiesFile) {
       System.out.println("parse with "+ methodNames + "method");
       if(methodNames.isEmpty()){
           return;
       }

       ASTRewrite rewrite = visitor.getRewrite();

        // to iterate through methods
       
        final List<AbstractTypeDeclaration> types = unit.types();
        for (final AbstractTypeDeclaration type : types) {
            if (type.getNodeType() == ASTNode.TYPE_DECLARATION) {
                // Class def found
                final List<BodyDeclaration> bodies = type.bodyDeclarations();
                for (final BodyDeclaration body : bodies) {
                    
                    if (body.getNodeType() == ASTNode.METHOD_DECLARATION) {
                        final MethodDeclaration method = (MethodDeclaration)body;
                     
                        if (methodNames.contains(method.getName().toString())) {
                        
                            //First, we want to add some instructions as first lines of the method to create the output
                            //file for this method, where the sequential code is going to be outputted.
                            //Then, the visitor has to inspect every line of code and insert an output instruction to the
                            //previously created file, containing the exact line that just run, to obtain
                            //the secuential code branch. If it is a guard, replace it and brackets with an assert.

                            //To do this, we will implement an ASTVisitor that does everything we want, and we will
                            //give it the AST Tree to visit starting at this method.
                            
                            method.accept(visitor);
                            
                            propertiesFile.setProperty(canonicalClassName, method.getName().toString());
                            
                            
                        }
                    }
                }
                type.accept(visitor);
            }
        }
        
        List<ImportDeclaration> imports = unit.imports();
        for(ImportDeclaration imp: imports){
            imp.accept(visitor);
        }
        unit.getPackage().accept(visitor);
      
        //Reescribimos el archivo fuente con su instrumentacion
        TextEdit edits = rewrite.rewriteAST(document, null);
        try {
            edits.apply(document);
        } catch (MalformedTreeException | BadLocationException e) {
            // Handle Exceptions
        }
        try {
            //            System.out.println(document.get());
            FileUtils.writeToFile(newFileName, document.get());

        } catch (final IOException e) {
            // Handle exceptions
        }
 
    }
 
 
    
}
