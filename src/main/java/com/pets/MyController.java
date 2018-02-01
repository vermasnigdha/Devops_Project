package com.pets;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pets.breed.*;
import com.pets.cart.*;
import com.pets.category.*;
import com.pets.signup.*;

@Controller
public class MyController {

	@Autowired
	BreedDAO bdao;
	
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	signupDAO sdao;

	@Autowired
	CartDAO cartdao;
	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	//System.out.println("User present");
	    	return "loggedin";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "notloggedin";
	    }
	 }
	
	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView("index");
		
		return mv;
	}
	
	@RequestMapping("/aboutus")
	public ModelAndView aboutus()
	{
		ModelAndView mv = new ModelAndView("aboutus");
		
		return mv;
	}
	
	@RequestMapping("/contactus")
	public ModelAndView contactus()
	{
		ModelAndView mv = new ModelAndView("contactus");
		
		return mv;
	}
		
	@RequestMapping("/signup")
	public ModelAndView signup()
	{
		ModelAndView mv = new ModelAndView("signup");
	
		mv.addObject("signup",  new signup() );
		
		return mv;
	}
	
	@RequestMapping(value="/signuptodb")
	public ModelAndView signuptodb( @Valid @ModelAttribute("signup") signup s , BindingResult bind)
	{
		ModelAndView mv = new ModelAndView("redirect:/signup");
		
		if(bind.hasErrors())
		{
			mv = new ModelAndView("signup");
			
			mv.addObject("signup",  s );
			
			return mv;
		}
		
		sdao.insert(s);
		
		return mv;
	}
	
	@RequestMapping("/AddCategory")
	public ModelAndView AddCategory()
	{
		ModelAndView mv = new ModelAndView("AddCategory");
		
		mv.addObject("Category",  new Category() );
		
		return mv;
	}
	
	@RequestMapping(value="/AddCategoryToDB")
	public ModelAndView AddCategoryToDB( @ModelAttribute("Category") Category c )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.insert(c);
		
		return mv;
	}
	
	@RequestMapping("/ViewCategory")
	public ModelAndView ViewCategory()
	{
		ModelAndView mv = new ModelAndView("ViewCategory");
		
		mv.addObject("AllCategory",  cdao.getCategory() );
		
		return mv;
	}
	
	@RequestMapping("/UpdateCategory/{id}")
	public ModelAndView UpdateCategory(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("UpdateCategory");
		
		mv.addObject("Category",  cdao.getCategory(id));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateCategory/UpdateCategoryToDB",method=RequestMethod.POST)
	public ModelAndView UpdatCategoryToDB( @ModelAttribute("Category") Category p )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.update(p);
		
		return mv;
	}
	
	@RequestMapping("/DeleteCategoryFromDB/{id}")
	public ModelAndView DeleteCategoryFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.delete(id);
		
		return mv;
	}
		

	@RequestMapping("/AddBreed")
	public ModelAndView AddBreed()
	{
		ModelAndView mv = new ModelAndView("AddBreed");
		
		mv.addObject("Breed",  new Breed() );
		
		return mv;
	}
	
	@RequestMapping(value="/AddBreedToDB")
	public ModelAndView AddBreedToDB( @ModelAttribute("Breed") Breed b, HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewBreed");

		try
		{
			System.out.println(b.getF());
			
			byte bit[] = b.getF().getBytes();
			
			System.out.println( req.getRealPath("/") );
			
			File f1 = new File( req.getRealPath("/") +  "/image.jpg");
			
			 BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(f1));
	            stream.write(bit);
	            stream.close();
	            
	            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
	            		  "cloud_name", "djg9jy82g",
	            		  "api_key", "743342157914966",
	            		  "api_secret", "dxG1OSWWEISsKTEaxCMmcdD6YWo"));
	            
	            Map uploadResult = cloudinary.uploader().upload(f1, ObjectUtils.emptyMap());
			
	            System.out.println( uploadResult );
	            
	            System.out.println(uploadResult.get("secure_url").toString());
	            
	            b.setImagePath(uploadResult.get("secure_url").toString());
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
		bdao.insert(b);
		
		return mv;
	}
	
	@RequestMapping("/ViewBreed")
	public ModelAndView ViewBreed()
	{
		ModelAndView mv = new ModelAndView("ViewBreed");
		
		mv.addObject("AllBreed",  bdao.getBreed() );
		
		return mv;
	}
	
	@RequestMapping("/UpdateBreed/{id}")
	public ModelAndView UpdateBreed(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("UpdateBreed");
		
		mv.addObject("Breed",  bdao.getBreed(id));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateBreed/UpdateBreedToDB",method=RequestMethod.POST)
	public ModelAndView UpdatBreedToDB( @ModelAttribute("Breed") Breed q )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewBreed");
		
		bdao.update(q);
		
		return mv; 
	}
	
	@RequestMapping("/DeleteBreedFromDB/{id}")
	public ModelAndView DeleteBreedFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewBreed");
		
		bdao.delete(id);
		
		return mv;
	}
	
	
	@RequestMapping("/ViewOneBreed/{id}")
	public ModelAndView ViewOneBreed(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("ViewOneBreed");
		mv.addObject("Breed",bdao.getBreed(id));
		return mv;
	}
	
	@RequestMapping(value="/AddCartToDB",method=RequestMethod.POST)
	public ModelAndView AddCartToDB( @RequestParam("qty") int q, @RequestParam("id")int abc  )
	{
		ModelAndView mv = new ModelAndView("redirect:/cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null && !auth.getName().equals("anonymousUser"))
		 {
			 String currUser=auth.getName();
		
			 boolean found = false;
			 int id = -1;
		
		for( Cart c1 : cartdao.getProductsbyName(currUser) )
		{
			if( c1.getUsername().equals(currUser) && c1.getPid()==abc  )
			{
				found = true;
				id = c1.getPid();
				break;				
			}
		}
		
		if( found )
		{
			Cart c = cartdao.getCart(id);
			Breed b=bdao.getBreed(abc);
			int qty1=b.getQty();
			int x = c.getQty();
			
			qty1=qty1+x-q;
		
			b.setQty(qty1);
		    this.bdao.update(b);
           
			c.setQty(q);
			this.cartdao.update(c);
			System.out.println("updated");
			return mv;

		}

		System.out.println(auth.getName());
		
    	Cart c = new Cart();
		
    	Breed b=bdao.getBreed(abc);
		int qty1=b.getQty();
		qty1=qty1-q;
		System.out.println("i "+qty1);
		b.setQty(qty1);
		System.out.println(b.getQty());
		this.bdao.update(b);
	
		c.setUsername( auth.getName() );
		c.setPid(abc);
		c.setQty(q);
		
		this.cartdao.add(c);
		 }
		 return mv;
	}
	
	@RequestMapping("/DeleteOneBreed/{id}")
	public ModelAndView DeleteOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewBreed");
		
		bdao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/UpdateOneBreed/{id}")
	public ModelAndView UpdateOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateBreed");
	
		
		Breed b = bdao.getBreed(abc);
		mv.addObject("Breed",b);
		mv.addObject("Category", cdao.getCategory());
		return mv;
	}
}
