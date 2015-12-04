package lalala;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
 
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.ASTParser;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.AbstractTypeDeclaration;
import org.eclipse.jdt.core.dom.BodyDeclaration;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.MethodDeclaration;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jface.text.Document;
import org.eclipse.jface.text.IDocument;
 
public class Main {
    
    //use ASTParse to parse string
    public static void parse(String str) {
        org.eclipse.jdt.core.dom.ASTParser parser = org.eclipse.jdt.core.dom.ASTParser.newParser(org.eclipse.jdt.core.dom.AST.JLS4);

        parser.setSource(str.toCharArray());
        parser.setKind(ASTParser.K_COMPILATION_UNIT);
 
     // Parse the source code and generate an AST.
        final CompilationUnit unit = (CompilationUnit) parser.createAST(null);

        //Add imports to enable file output of the instrumented code
        final AST ast = unit.getAST();
 
        ASTVisitor astv = new ASTVisitor() {
 
            Set names = new HashSet();
            
            public boolean visit(VariableDeclarationFragment node) {
                SimpleName name = node.getName();
                this.names.add(name.getIdentifier());
                System.out.println("Declaration of '" + name + "' at line"
                        + unit.getLineNumber(name.getStartPosition()));
                return false; // do not continue 
            }
 
            public boolean visit(SimpleName node) {
                if (this.names.contains(node.getIdentifier())) {
                    System.out.println("Usage of '" + node + "' at line "
                            + unit.getLineNumber(node.getStartPosition()));
                }
                return true;
            }
        };


        //StrykerASTVisitor visitor = new StrykerASTVisitor(wrapper, unit, source, ast, seqFileName, lastMutatedLines, mutableLines);
        // to iterate through methods
        final List<AbstractTypeDeclaration> types = unit.types();
        for (final AbstractTypeDeclaration type : types) {
            if (type.getNodeType() == ASTNode.TYPE_DECLARATION) {
                // Class def found
                final List<BodyDeclaration> bodies = type.bodyDeclarations();
                for (final BodyDeclaration body : bodies) {
                    if (body.getNodeType() == ASTNode.METHOD_DECLARATION) {
                        final MethodDeclaration method = (MethodDeclaration)body;
                        //if (method.getName().toString().contains(wrapper.getMethod())) {
                        
                            //First, we want to add some instructions as first lines of the method to create the output
                            //file for this method, where the sequential code is going to be outputted.
                            //Then, the visitor has to inspect every line of code and insert an output instruction to the
                            //previously created file, containing the exact line that just run, to obtain
                            //the secuential code branch. If it is a guard, replace it and brackets with an assert.

                            //To do this, we will implement an ASTVisitor that does everything we want, and we will
                            //give it the AST Tree to visit starting at this method.
                            
                            //astv.setMethodName(method.getName().toString());
                            //astv.setNextMutID(0);
                            method.accept(astv);

                        //}
                    }
                }
            }
        }
        unit.accept(astv);
 
    }
 
    //read file content into a string
    public static String readFileToString(String filePath) throws IOException {
        StringBuilder fileData = new StringBuilder(1000);
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
 
        char[] buf = new char[10];
        int numRead = 0;
        while ((numRead = reader.read(buf)) != -1) {
            System.out.println(numRead);
            String readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[1024];
        }
 
        reader.close();
 
        return  fileData.toString();    
    }
 
    //loop directory to get file list
    public static void ParseFilesInDir() throws IOException{
        File dirs = new File(".");
        String dirPath = dirs.getCanonicalPath() + File.separator+"src"+File.separator;
 
        File root = new File(dirPath);
        //System.out.println(rootDir.listFiles());
        File[] files = root.listFiles ( );
        String filePath = null;
 
         for (File f : files ) {
             filePath = f.getAbsolutePath();
             
             if(f.isFile()){
                 parse(readFileToString(filePath));
             }
         }
    }
 
    public static void main(String[] args) throws IOException {
        ParseFilesInDir();
    }
}
