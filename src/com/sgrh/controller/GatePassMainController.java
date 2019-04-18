package com.sgrh.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Joiner;
import com.google.common.base.Strings;
import com.sgrh.bean.User;
import com.sgrh.bean.Visitor;
import com.sgrh.bean.VisitorEntry;
import com.sgrh.dao.DepartmentDAOImp;
import com.sgrh.dao.VisitorDAOImp;
import com.sgrh.fineupload.io.StorageService;
import com.sgrh.fineupload.model.UploadRequest;
import com.sgrh.fineupload.model.UploadResponse;
import com.sgrh.utility.Base64ToImage;
import com.sgrh.utility.SmsSender;

@Controller
@SessionAttributes({"visitor","visitor_entry","old_visitor","user"})
public class GatePassMainController {
	
	@Autowired
	private StorageService storageService;
	@Autowired 
	private VisitorDAOImp visitorDao;
	@Autowired
	private DepartmentDAOImp departmentDao;
	
	
	@RequestMapping(value="/")
	public String mainForm(final Model model) {
		Visitor visitor = new Visitor();
		/*VisitorEntry entry = new VisitorEntry();
		entry.setVisitDate(LocalDate.now());
		entry.setVisitTime(LocalTime.now());*/
		//visitor.getVisitorEntryList().add(entry);
		model.addAttribute("visitor",visitor);
		model.addAttribute("old_visitor",false);
		return "index";
	}
	
	@RequestMapping("save")
	public String saveForm( Model model, @Valid @ModelAttribute("visitor") Visitor visitor, 
			@ModelAttribute("old_visitor") boolean oldVisitor, @ModelAttribute("visitor_entry") VisitorEntry en,
			BindingResult result, HttpSession session) {
		Visitor v = (Visitor)session.getAttribute("visitor");
		long gatePassNo = visitorDao.saveVisitor(visitor,oldVisitor,en);
		String msg = "Welcome "+ visitor.getName() +" ! Your Gate Pass No : "+gatePassNo+". Issue Date : "+en.getVisitDate()
		+".Dept : "+en.getVisitReason();
		
		
		// Send GatePass sms to visitor
		SmsSender.sendMsg(msg,v.getContact());
		return "redirect://";
	}
	
	@RequestMapping("search")
	public String searchForm(Model model) {
		model.addAttribute("deptList",departmentDao.getDeptList());
		return "search_page";
	}
	
	/*
	@RequestMapping(value="search_result")
	public String getSearchResult(){
		return "test_db";
	}*/
	
	@RequestMapping("search_result")
	public String processSearch(
			@RequestParam("name") String name,
			@RequestParam("contact") String contact,
			@RequestParam("company") String company,
			@RequestParam("department") String department,
			@RequestParam("to_date") String toDate,
			@RequestParam("from_date") String fromDate,
			@RequestParam("pass_no") String passNo,
			Model model
			){
		System.out.println("Hello from processSearch method GatePassMainController.class");
		model.addAttribute("deptList",departmentDao.getDeptList());
		if(!Strings.isNullOrEmpty(name)) {
			name= "name like '%".concat(name).concat("%'");
		}
		if(!Strings.isNullOrEmpty(contact)) {
			contact= "Contact = '".concat(contact).concat("'");
		}
		if(!Strings.isNullOrEmpty(company)) {
			company = "Company = '".concat(company).concat("'");
		}
		if(!Strings.isNullOrEmpty(passNo)) {
			passNo = "visitorentry.pass_no = ".concat(passNo);
		}
		if(!Strings.isNullOrEmpty(department)) {
			department = "visitorentry.visit_department ='".concat(department).concat("'");
		}
		if(!Strings.isNullOrEmpty(fromDate)){
			fromDate = "visitorentry.visit_date >= '".concat(fromDate).concat("'");
		}
		if(!Strings.isNullOrEmpty(toDate)){
			toDate = "visitorentry.visit_date <= '".concat(toDate).concat("'");
		}
		String joiner = Joiner.on(" AND ").skipNulls().join("1=1",Strings.emptyToNull(name),Strings.emptyToNull(passNo),Strings.emptyToNull(contact),Strings.emptyToNull(company),Strings.emptyToNull(department),Strings.emptyToNull(fromDate),Strings.emptyToNull(toDate));
		System.out.println(joiner);
		model.addAttribute("visitorList", visitorDao.getSearchResult(joiner));
		return "search_page";
	}
	
	@RequestMapping("printing")
	public String printBarcode(Model model, @ModelAttribute("visitor") Visitor visitor) {
		System.out.println(visitor.getName());
		return "barcode_printing";
	}
	
	@RequestMapping("processed")
	public String fileUploader(Model model, @ModelAttribute("visitor") final Visitor visitor, 
			@Valid @ModelAttribute("visitor_entry") final VisitorEntry entry,BindingResult result, @ModelAttribute("old_visitor") final boolean oldVisitor,
			final Errors error /*@RequestParam("id") int id*/, HttpSession session, HttpServletRequest request) {
		if(result.hasErrors()) {
			model.addAttribute("visitor",visitor);
			model.addAttribute("old_visitor",oldVisitor);
			return "redirect:entry_page";
		}
		else {
		Visitor vis = (Visitor)session.getAttribute("visitor");
		vis.getVisitorEntryList().add(entry); // In case we visitor is an old visitor this will fail if visitor entry list loading is lazy.
		System.out.println("Method : fileUploader : Visitor Id "+visitor.getId());
		if(!oldVisitor) {
			String imgName = vis.getName() + vis.getContact();
			String personImgName = imgName+"_person.jpeg";
			String idImage = imgName+"_id.jpeg";
			String realPath = request.getServletContext().getRealPath(File.separator);
			// Save person image
			Base64ToImage.getImageFromBase64(vis.getImagePath(), personImgName, realPath);
		// Save id image
			Base64ToImage.getImageFromBase64(vis.getIdImagePath(), idImage, realPath);
			visitor.setImagePath(personImgName);
			visitor.setIdImagePath(idImage);
		}
		//System.out.println("Processed Form"+visitor.getVisitorEntryList().get(0).getVisitReason());
		System.out.println(entry.getVisitDate());
		model.addAttribute("visitor",visitor);
		model.addAttribute("visitor_entry",entry);
		return "processed_form";
		}
	}
	
	@RequestMapping(value="uploadParser")
	@ResponseBody
	  public void upload(
	            @RequestParam("qqfile") MultipartFile file,
	            @RequestParam("qquuid") String uuid,
	            @RequestParam("qqfilename") String fileName,
	            @RequestParam(value = "qqpartindex", required = false, defaultValue = "-1") int partIndex,
	            @RequestParam(value = "qqtotalparts", required = false, defaultValue = "-1") int totalParts,
	            @RequestParam(value = "qqtotalfilesize", required = false, defaultValue = "-1") long totalFileSize,
	            HttpServletRequest req, @Valid @ModelAttribute Visitor visitor, BindingResult result,HttpServletResponse response) {
			String targetPath = null;
			try {
				System.out.println(visitor.getName());
				System.out.println("qquuid "+uuid);
				System.out.println("qqfilename"+fileName);
		        UploadRequest request = new UploadRequest(uuid, file);
		        request.setFileName(fileName);
		        request.setTotalFileSize(totalFileSize);
		        request.setPartIndex(partIndex);
		        request.setTotalParts(totalParts);
		        storageService.save(request,req);
		        
		        visitor.setImagePath(uuid.concat("/").concat(fileName));
		        //System.out.println(visitorDao.saveVisitor(visitor,true));
		        targetPath = "processed_form";
			}
			catch(Exception ex) {
				System.out.println("Exception Thrown");
				targetPath = "index";
			}
			JSONObject response_obj = new JSONObject();
			try {
				response_obj.put("success",true);
				response_obj.put("visitor_id", visitor.getId());
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text");
				response.getWriter().print(response_obj);
				response.flushBuffer();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	
	// page for user image
	@RequestMapping("/image_capture")
	public String captureImage(Model model,final @Valid @ModelAttribute("visitor") Visitor visitor, BindingResult result, final Errors error) {
		System.out.println(result.hasErrors());
		if(result.hasErrors()) {
			return "index";
		}
		else {
		model.addAttribute("visitor",visitor); 
		return "person_pic";
		}
	}
	
	@RequestMapping("/id_image_capture")
	public String captuerIdImage(Model model, final @ModelAttribute("visitor") Visitor visitor, final Errors error) {
		model.addAttribute("visitor", visitor);
		return "person_pic";
	}
	
	@RequestMapping("login_page")
	public String login(Model model,@RequestParam String page){
		model.addAttribute("redirectPage", page);
		return "login";
	}
	
	@RequestMapping("entry_page")
	public String entryPage(Model model, final @ModelAttribute("visitor") Visitor visitor, @ModelAttribute("user") String user,final Errors error) {
		model.addAttribute("visitor",visitor);
		System.out.println("visitor id" + visitor.getId());
		VisitorEntry entry = new VisitorEntry();
		entry.setVisitDate(LocalDate.now());
		entry.setVisitTime(LocalTime.now());
		//System.out.println(userName);
		/*
		System.out.println("lksjflksdj"+visitorDao.getLastPassNo());
		int gatePassNo = visitorDao.getLastPassNo();
		if(gatePassNo > 0) {
			gatePassNo += 1;
		}
		else {
			gatePassNo = 1;
		}
		//entry.setGatePassNo(gatePassNo);*/
		System.out.println("User : "+user);
		entry.setUser(user);
		model.addAttribute("visitor_entry",entry);
		model.addAttribute("deptList",departmentDao.getDeptList());
		return "entry_page";
	}
	
	@RequestMapping("get_visitor")
	public String getVisitor(Model model,@RequestParam("id")int id) {
		Visitor visitor = visitorDao.getVisitor(id);
		model.addAttribute("visitor", visitor);
		model.addAttribute("old_visitor",true);
		return "redirect:entry_page";
	}
	
	/*@ExceptionHandler(Exception.class)
	public String exceptionThrown() {
		return "redirect://";
	}*/

	@RequestMapping("process_login")
	public String processLogin(HttpServletRequest request, @RequestParam String username, @RequestParam String password, @RequestParam String redirectPath, Model model) {
		User user = visitorDao.getUser(username);
		String page = "login";
		try {
			if(user != null) {
				String name=user.getUsername();
				String pwd = user.getPassword();
				password = "{NOOP}"+password;
				System.out.println(name.equalsIgnoreCase(username));
				System.out.println(pwd.equals(password));
				
				if(name.equalsIgnoreCase(username) && pwd.equals(password)) {
					page = redirectPath;
					System.out.println("TRUE");
					HttpSession session = request.getSession();
					session.setAttribute("isLogged", true);
					session.setMaxInactiveInterval(60*60); // invalidate session after 10 min of inactivity
					//userName = user.getUsername();
					model.addAttribute("user",user.getUsername());
				}
			}
		}
		catch(Exception ex) {
			ex.getStackTrace();
		}
		return redirectPath;
	}
	
	@RequestMapping(value = "clear")
	public String clearAndRedirect(Model model, @ModelAttribute("visitor") Visitor visitor, @ModelAttribute("visitor_entry") VisitorEntry visitorEntry,
			@ModelAttribute("old_visitor") boolean old_user) {
		model.addAttribute("visitor", null);
		model.addAttribute("visitor_entry",null);
		model.addAttribute("old_visitor",false);
		return "redirect://";
	}
	
	@RequestMapping(value = "log_out")
	public String logOut( HttpSession session) {
		System.out.println("Logout being called.");
		session.invalidate();
		return "redirect://";
	}
	
	@RequestMapping(value = "pass")
	public String showPass() {
		return "show_pass";
	}
	
}
