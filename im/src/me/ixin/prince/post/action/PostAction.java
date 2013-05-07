package me.ixin.prince.post.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import me.ixin.prince.post.model.Post;
import me.ixin.prince.post.service.PostManager;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;

@InjectName("postAction")
@IocBean
public class PostAction {

	@Inject("refer:postMgr")
	private PostManager postMgr ;
	
	@At("/post/?")
	@GET
	@Ok("jsp:pages.post")
	public String showOBJ(int postId){
		//System.out.println(postId);
		Post p = postMgr.findPostByID(Long.valueOf(1));
		
		return "is a msg:" + p.getContent();
	}
	
	@At("/index")
	@GET
	@Ok("jsp:pages.index")
	public List<Map<String, String>> showList(){
		List<Map<String, String>> l = new ArrayList<Map<String, String>>();
		Map<String, String> m1 = new HashMap<String, String>();
		m1.put("id", "25");
		m1.put("name", "web.xml 中的映射 - url-pattern");
		m1.put("own", "小辛");
		m1.put("time", "2012-02-20");
		m1.put("content", "D - 渲染: 根据入口函数的返回，渲染 HTTP Response。D - 渲染: 根据入口函数的返回，渲染 HTTP Response。D - 渲染: 根据入口函数的返回，渲染 HTTP Response。");
		Map<String, String> m2 = new HashMap<String, String>();
		m2.put("id", "27");
		m2.put("name", "在 Nutz.Mvc 中的映射");
		m2.put("own", "小王");
		m2.put("time", "2013-04-03");
		m2.put("content", "大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。");
		l.add(m1);
		l.add(m2);
		return l;
	}
}
