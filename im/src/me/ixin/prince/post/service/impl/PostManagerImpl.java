package me.ixin.prince.post.service.impl;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import me.ixin.prince.post.dao.PostDao;
import me.ixin.prince.post.model.Post;
import me.ixin.prince.post.service.PostManager;

@InjectName("postMgr")
@IocBean
public class PostManagerImpl implements PostManager{
	
	@Inject("refer:postDao")
	private PostDao postDao ;
	
	@Override
	public Post savePost(Post post) {
		return postDao.savePost(post);
	}

	@Override
	public int updatePost(Post post) {
		return postDao.updatePost(post);
	}

	@Override
	public int delPost(Long id) {
		return postDao.delPost(id);
	}

	@Override
	public Post findPostByID(Long id) {
		return postDao.findPostByID(id);
	}

}
