package com.pets;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pets.breed.*;
import com.pets.cart.*;
import com.pets.signup.*;

@RestController
public class TheGreatRestController {

	@Autowired
	CartDAO cdao;
	
	@Autowired
	BreedDAO bdao;
	
	@Autowired
	signupDAO sdao;
	

	private String getCurrentUser(){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	System.out.println("User present");
	    	return auth.getName();
	    }
	    
		return "";
	}
	
	@RequestMapping(value="fetchCartItems",method=RequestMethod.POST)
	public ResponseEntity<String> fetchCartItems()
	{
		JSONObject jobj= new JSONObject();
		
		System.out.println(jobj.toJSONString());
		
		JSONArray jarr = new JSONArray();
		
		String user = this.getCurrentUser();
		
		for( Cart c : cdao.getCart() ){
		
			
			if( c.getUsername().equals(user) ){
				jobj = new JSONObject();
				
				Breed b = bdao.getBreed(c.getPid());
				
				jobj.put("cid", c.getId());
				
				jobj.put("bname", b.getName());
				jobj.put("bprice", b.getPrice());
				
				jobj.put("bqty",b.getQty());
				
				jobj.put("bimg",b.getImagePath());
				
				jarr.add(jobj);
			}
			
		}
		
		System.out.println(jarr.toJSONString());
		
		return new ResponseEntity<String>(jarr.toJSONString(),HttpStatus.OK);
	}
	
	@RequestMapping(value="/DeleteCartItems",method=RequestMethod.POST)
	public String DeleteCartItems()
	{
		System.out.println("DeleteCartItems");
	
		String user = this.getCurrentUser();
		
		for( Cart c : cdao.getCart() )
		{
			if( c.getUsername().equals(user) )
			{	
			int a=c.getId();
			cdao.delete(a);	
			}
		}
		return "{\"msg\":\"Deleted Items\"}";
	}
	@RequestMapping(value="/UpdateCartAddToDB",method=RequestMethod.POST)
	public String UpdateCartToDB(@RequestBody String data)
	{
		System.out.println("UpdateCartAddToDB");
		
		String user = this.getCurrentUser();
	    
	    System.out.println(data);
	
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);
			
			String ship = inp.get("ship").toString();
			String bill = inp.get("bill").toString();
			cdao.update(user, ship, bill);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Updated\"}";
	}
	
	@RequestMapping(value="/deletefromcart",method=RequestMethod.POST)
	public String deletefromcart(@RequestBody String data)
	{
		System.out.println("deletefromcart");
	
		System.out.println(data);
		
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);
			
			int id = Integer.parseInt( inp.get("id").toString() );
			
			Cart c=cdao.getCart(id);
			int q=c.getQty();
			
			Breed b=bdao.getBreed(c.getId());
			int qty1=b.getQty();
			qty1=qty1+q;
			b.setQty(qty1);
			this.bdao.update(b);
			cdao.delete(id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Deleted\"}";
	}
	
	@RequestMapping(value="/getAddress",method=RequestMethod.POST)
	public String getAddress()
	{
		System.out.println("getAddress");
		
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
	    
	    JSONObject jobj = new JSONObject();
			
		for( signup s : sdao.getsignup())
		{
			
			if( s.getEmail().equals(currUser))
			{	
				String add = s.getAddress();
				
				System.out.println(add);
				jobj.put("BAdd", s.getAddress());
				jobj.put("SAdd", s.getAddress());
				
				
				return jobj.toJSONString();
			}
			
		}
		
		return jobj.toJSONString();
	}
}
