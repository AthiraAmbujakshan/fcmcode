
package com.cognizant.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.cognizant.test.module.data.ModuleList;
import com.cognizant.test.module.data.Project;

@Controller
public class File_UploadController {

	@Autowired
	MappingController mappingcontroller;


	

	private static String UPLOAD_FOLDER = "moduledatafile";
	
	
	ArrayList<ArrayList<String>> brr = new ArrayList<ArrayList<String>>();
	
	public ArrayList<ArrayList<String>> getValues() {
		return brr;
	}

		
	@RequestMapping(method = RequestMethod.POST, value = "/uploadfile")
	public String fileUpload(@ModelAttribute("modulelist") ModuleList modulelist, @RequestParam String modulename,
			@ModelAttribute("project") Project project, @RequestParam String dropdown, Model model,
			@RequestParam String delimiter, @RequestParam("dsvfile") MultipartFile dsvfile)
			throws FileNotFoundException {
		brr = new ArrayList<ArrayList<String>>();
		try {
// read and write the file to the selected location-
			byte[] bytes = dsvfile.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + dsvfile.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			;
		}
		Scanner sc = null;
		String str = "";
		List<String> arr = new ArrayList<String>();
		List<String> list = new ArrayList<String>();
		ArrayList<String> value = new ArrayList<String>();
		try {
			sc = new Scanner(new File(UPLOAD_FOLDER + dsvfile.getOriginalFilename()));
			str = sc.nextLine();
			while (sc.hasNextLine())
				arr.add(sc.nextLine());
			
			
		} catch (IOException exp) {

			exp.printStackTrace();
		}
		Scanner lineScanner = new Scanner(str);
		lineScanner.useDelimiter(delimiter);
		while (lineScanner.hasNext()) {
			list.add(lineScanner.next());
		}
		
		for (int i = 0; i < arr.size(); i++) {
			Scanner lineScanner1 = new Scanner(arr.get(i));
			lineScanner1.useDelimiter(delimiter);
			while (lineScanner1.hasNext()) {
				value.add(lineScanner1.next());
			}
			brr.add(value);
			value = new ArrayList<String>();
			lineScanner1.close();
		}
		lineScanner.close();
		model.addAttribute("myfile", list);
	
		
		
		System.out.println("File Uploaded Controler 2D array");
	
		return mappingcontroller.connectToOracleDb(modulelist, model, modulename, project, dropdown);
	}


	
	
	
	
	}

	
