package me.ixin.prince.post.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;

@Modules(scanPackage = true)
public class PostAction {
	@At("/post/?")
	@GET
	@Ok("jsp:pages.post")
	public String showOBJ(int postId){
		//System.out.println(postId);
		return "is a msg";
	}
	
	@At("/profile")
	@GET
	@Ok("jsp:pages.profile")
	public List<Map<String, String>> showList(){
		List<Map<String, String>> l = new ArrayList<Map<String, String>>();
		Map<String, String> m1 = new HashMap<String, String>();
		m1.put("own", "小辛");
		m1.put("time", "2012-02-20");
		m1.put("content", "D - 渲染: 根据入口函数的返回，渲染 HTTP Response。D - 渲染: 根据入口函数的返回，渲染 HTTP Response。D - 渲染: 根据入口函数的返回，渲染 HTTP Response。");
		Map<String, String> m2 = new HashMap<String, String>();
		m2.put("own", "小王");
		m2.put("time", "2013-04-03");
		m2.put("content", "大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。大家遇到迷惑了吗？遇到了就对了，说明 再走下去就会成功了。");
		l.add(m1);
		l.add(m2);
		return l;
	}
}
