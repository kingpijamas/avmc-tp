/*
 * TACO: Translation of Annotated COde
 * Copyright (c) 2010 Universidad de Buenos Aires
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA,
 * 02110-1301, USA
 */
package ar.edu.taco.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

public class FileUtils {
	static final private String NORMALIZATED_FILE_SEPARATOR = "/";
	
	public static String readFile(String filename) throws IOException {
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = new BufferedReader(new FileReader(filename));
		String line;
		while ((line = reader.readLine()) != null) {
			builder.append(line);
			builder.append(System.getProperty("line.separator"));
		}
		reader.close();
		return builder.toString();
	}
	
	public static void writeToFile(String path, String fileContent) throws IOException {
		String normalizatedFileName = normalizateFileName(path);				
		int slashPosition = normalizatedFileName.lastIndexOf(NORMALIZATED_FILE_SEPARATOR);
		if (slashPosition >= 0)  {
			File aFile = new File(normalizatedFileName.substring(0, slashPosition));
			if (!aFile.exists()) {
				aFile.mkdirs();
			}
		}
		
		FileWriter fileWriter = new FileWriter(path);
		fileWriter.write(fileContent);
		fileWriter.close();
	}
	
	public static void appendToFile(String path, String fileContent) throws IOException {
	    String normalizatedFileName = normalizateFileName(path);                
	    int slashPosition = normalizatedFileName.lastIndexOf(NORMALIZATED_FILE_SEPARATOR);
	    if (slashPosition >= 0)  {
	        File aFile = new File(normalizatedFileName.substring(0, slashPosition));
	        if (!aFile.exists()) {
	            aFile.mkdirs();
	        }
	    }

	    FileWriter fileWriter = new FileWriter(path, true);
	    fileWriter.write(fileContent);
	    fileWriter.close();
	}
	
	private static String normalizateFileName(String path) {
		String normalizatedFileName;
		if (File.separator.equals("\\")) {
			normalizatedFileName = path.replaceAll("\\\\",NORMALIZATED_FILE_SEPARATOR );
		} else {
			normalizatedFileName = path;
		}
		return normalizatedFileName;
	}
	
	/*
	 * Change package path with dots to directory path with backslashes (ie: ar.edu.taco.utils.FileUtils to ar/edu/taco/utils/FileUtils)
	 * Be careful to not pass the file extension!
	 * */
	public static String normalizatePackageName(String path){
	    String normalizatedFileName = path.replaceAll("\\.", NORMALIZATED_FILE_SEPARATOR);
	    return normalizatedFileName;
	}
	
	/*
	 * */
	public static void storeInPropertiesFile(String fileName, String comment, Properties properties){
	    try {
	          
	          File file = new File(fileName);
	          FileOutputStream fileOut = new FileOutputStream(file);
	          properties.store(fileOut, comment);
	          fileOut.close();
	          
	      } catch (FileNotFoundException e) {
	          // do something??
	          
	      } catch (IOException e) {
	          // do something??
	          
	      }
	}
	
	public static Collection<Object[]> readPropertiesFile(String fileName){
	    List<Object[]> lala = new java.util.ArrayList<Object[]>();
	    try {
            File file = new File(fileName);
            FileInputStream fileInput = new FileInputStream(file);
            Properties properties = new Properties();
            properties.load(fileInput);
            fileInput.close();
            
            Enumeration enuKeys = properties.keys();
            while (enuKeys.hasMoreElements()) {
                
                
                String key = (String) enuKeys.nextElement();
                String value = properties.getProperty(key);
                Object[] lalo = {key,value};
                lala.add(lalo);
//                System.out.println(key + ": " + value);
            }
            
        } catch (FileNotFoundException e) {
            // do something??
            
        } catch (IOException e) {
            // do something??
        
        }
	    
	    return lala;
	}
}
