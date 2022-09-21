package com.fastcampus.app.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fastcampus.app.domain.AttachImageDto;
import com.fastcampus.app.domain.CategoryDto;
import com.fastcampus.app.domain.ProductDto;
import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.domain.UserOrderDto;
import com.fastcampus.app.service.ProductService;
import com.fastcampus.app.service.UserOrderService;
import com.fastcampus.app.service.UserService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService userService;
	@Autowired
	UserOrderService orderService;
	@Autowired
	ProductService productService;

	@GetMapping("/adminPage")
	String adminPage(Model model) {		
		return "adminPage";
	}
	@GetMapping("/orderList")
	@ResponseBody
	public List<UserOrderDto> orderList(){
		//List<UserOrderDto> list = orderService.selectUserOrder("admin");
		List<UserOrderDto> list = orderService.selectAll();
		return list;
	}
	@GetMapping("/userList")
	@ResponseBody
	public List<UserDto> userList(){
		//List<UserOrderDto> list = orderService.selectUserOrder("admin");
		List<UserDto> list = userService.getUserList();
		return list;
	}
	
	@PutMapping("/shipping/{orderno}")
	@ResponseBody
	public String shippingOrder(@PathVariable int orderno) {
		orderService.shipping(orderno);
		return "success";
	}
	
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<AttachImageDto> uploadAjaxActionPOST(MultipartFile uploadFile) {
		String uploadFolder = "C:\\upload";
		
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;
		
		try {
			type = Files.probeContentType(checkfile.toPath());
			System.out.println("MIME TYPE : " + type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(!type.startsWith("image")) {
			
			AttachImageDto dto  = null;
			return new ResponseEntity<>(dto, HttpStatus.BAD_REQUEST);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);

		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		AttachImageDto dto = new AttachImageDto();
		
		
		/* 파일 이름 */
		String uploadFileName = uploadFile.getOriginalFilename();
		
		String uuid = UUID.randomUUID().toString();
		
		dto.setFileName(uploadFileName);
		dto.setUploadPath(datePath);
		dto.setUuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);
		
		/* 파일 저장 */
		try {
			uploadFile.transferTo(saveFile);
			
//			File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//			
//			BufferedImage bo_image = ImageIO.read(saveFile);
//			
//			double ratio = 3;
//			/*넓이 높이*/
//			int width = (int) (bo_image.getWidth() / ratio);
//			int height = (int) (bo_image.getHeight() / ratio);
//			
//			BufferedImage bt_image = new BufferedImage(width,height, BufferedImage.TYPE_3BYTE_BGR);
//							
//			Graphics2D graphic = bt_image.createGraphics();
//			
//			graphic.drawImage(bo_image, 0, 0,width,height, null);
//				
//			ImageIO.write(bt_image, "jpg", thumbnailFile);
			File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);				
			
			Thumbnails.of(saveFile)
	        .size(160, 160)
	        .toFile(thumbnailFile);

		} catch (Exception e) {
			e.printStackTrace();
		} 


		System.out.println("파일 업로드");
		System.out.println(uploadFile.getOriginalFilename());
		
		
		ResponseEntity<AttachImageDto> result = new ResponseEntity<AttachImageDto>(dto, HttpStatus.OK);
		
		return result;
	}
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		System.out.println("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			System.out.println("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	@PostMapping("/registProduct")
	public String registProduct( ProductDto dto) {
		System.out.println(dto);
		productService.registProduct(dto);
		return "adminPage";
	}
	
	
	
}
